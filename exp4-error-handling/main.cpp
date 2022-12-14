#include <fstream>
#include <string>
#include "Lexer.h"
#include "Parser.h"
#include "tree/Node.h"
#include "exceptions/FileIOError.h"
#include "ErrorHandler.h"

//#define STAGE_GRAMMAR_ANALYSIS
#define STAGE_ERROR_HANDLING

std::ifstream input("testfile.txt");  // TODO: 修改路径 ../
std::ofstream normalOutput("output.txt");  // TODO: 修改路径 ../
std::ofstream errorOutput("error.txt");  // TODO: 修改路径 ../
std::map<int, std::string> errorLog;

void grammarItemOutput(Node *cur) {
    if (!cur->isLeaf) {
        for (auto node: *(cur->getAllChildren())) {
            grammarItemOutput(node);
        }
    }
    if (cur->needOutput()) {
        normalOutput << cur->toString() << "\n";
    }
}

int main() {
    if (!input.is_open())
        throw FileIOError("ERROR IN OPENING FILE 'testfile.txt'!");
    if (!normalOutput.is_open())
        throw FileIOError("ERROR IN OPENING FILE 'printAll.txt'");

    auto *lexer = new Lexer();
    std::vector<Token *> &tokens = lexer->parse();

    auto *parser = new Parser(tokens);
    Node *root = parser->parse();

    delete lexer;
    delete parser;

#ifdef STAGE_GRAMMAR_ANALYSIS
    grammarItemOutput(root);
    normalOutput << std::flush;
#endif
    auto *errorHandler = new ErrorHandler(root);
    errorHandler->check();
#ifdef STAGE_ERROR_HANDLING
    auto it = errorLog.begin();
    while (it != errorLog.end()) {
        errorOutput << it->first << " " << it->second << "\n";
        ++it;
    }
    errorOutput << std::flush;
#endif
    input.close();
    normalOutput.close();
    errorOutput.close();

    delete errorHandler;
    delete root;

    return 0;
}