#ifndef MIPS_TRANSLATOR_H
#define MIPS_TRANSLATOR_H


#include "ICTranslator.h"
#include "item/reg.h"

class MipsTranslator {
public:
    const int tempStackAddressBase = 268500992;  // 0x10010000
    int tempStackAddressTop = 268500992;
    int tempFuncStackOffsetTop;
    int tempFuncStackOffsetBase = 0;
    /**
     * main函数专用：存局部变量
     */
    std::map<int, int> localVarId2mem;  // id 为负

    std::map<int, int> tempVarId2mem;  // id 为正

    std::map<int, int> localArrayId2mem;  // id 为正

    std::map<int, int> tempArrayId2mem;  // id 为负

    /**
     * 自定义函数专用：存局部变量, offset 相对于当前函数栈的 $sp
     */
    std::map<int, int> localVarId2offset;  // id 为负

    std::map<int, int> tempVarId2offset;  // id 为正

    std::map<int, int> localArrayId2offset;  // id 为正

    std::map<int, int> tempArrayId2offset;  // id 为负

    //---------------------

    std::map<Reg, bool> regUsage;

    std::map<Reg, int> reg2id;

    std::map<int, int> funcFVarParamId2offset;

    std::map<int, int> funcFArrayParamId2offset;

    ICTranslator *icTranslator;

    explicit MipsTranslator(ICTranslator *icTranslator);

    void translate();

    void translate_FuncDef(ICItemFunc *func);

    void translate_GlobalVarOrArrayDef(ICEntry *);

    void pushParams(const std::vector<ICItem *> *params);

    // recursiveFormerOffset: 当在递归调用的压栈过程，从 $sp lw时要加1000
    void lw(Reg reg, ICItemVar *var, bool whenPushingParamsRecursively = false);

    void lw(Reg dst, int offset, Reg base);

    void sw(Reg reg, ICItemVar *dst);

    void sw(Reg src, int offset, Reg base);

    void li(Reg reg, int imm);

    void move(Reg dst, Reg src);

    void pushTempReg();

    void popTempReg();

    void addiu(Reg dst, Reg src, int i);

    void jal(const ICItemFunc *calledFunc);

    void j(ICItemLabel *label);

    void beqz(Reg cond, ICItemLabel *label);

    void bnez(Reg cond, ICItemLabel *label);

    void exit();

    void getint(ICItemVar *dst);

    void printStr(int strId);

    void la(Reg reg, const std::string &label);

    static std::string strId2label(int strId);

    void syscall();

    void printInt(ICItemVar *var);

    void addu(Reg rd, Reg rs, Reg rt);

    void subu(Reg rd, Reg rs, Reg rt);

    void mul(Reg rd, Reg rs, Reg rt);

    void mul(Reg dst, Reg srcReg, int srcNum);

    void div(Reg rs, Reg rt);

    void mfhi(Reg reg);

    void mflo(Reg reg);

    void jr();

    void sll(Reg dst, Reg src, int bits);

    bool isFuncFParam(ICItemVar *var);

    bool isFuncFParam(ICItemArray *array);

    void sne(Reg rd, Reg rs, Reg rt);

    void seq(Reg rd, Reg rs, Reg rt);

    void sle(Reg rd, Reg rs, Reg rt);

    void slt(Reg rd, Reg rs, Reg rt);

    void sge(Reg rd, Reg rs, Reg rt);

    void sgt(Reg rd, Reg rs, Reg rt);

    void _or(Reg rd, Reg rs, Reg rt);

    void _and(Reg rd, Reg rs, Reg rt);

    void insertLabel(ICItemLabel *label);

    void clearLocalAndTempInFunc();

};


#endif //MIPS_TRANSLATOR_H
