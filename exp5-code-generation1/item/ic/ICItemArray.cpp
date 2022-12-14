#include "ICItemArray.h"

int ICItemArray::generateArrayId() {
    static int i = 0;
    return ++i;
}

int ICItemArray::generateTempArrayId() {
    static int i = 0;
    return ++i;
}

/**
 *
 * @param originalName
 * @param symbolTableEntry
 * @param isGlobal
 * @param isConst
 * @param length
 * @param value
 */
ICItemArray::ICItemArray(const std::string *originalName,
                         SymbolTableEntry *symbolTableEntry, bool isGlobal,
                         bool isConst, int length, int *value) :
        ICItem(ICItemType::Array),
        isConst(isConst),
        value(value),
        length(length),
        isGlobal(isGlobal),
        arrayId(generateArrayId()),
        tempArrayId(-1),
        symbolTableEntry(symbolTableEntry),
        originalName(originalName),
        isTemp(false),
        itemsToInitArray(nullptr) {}

/**
 *
 * @param isGlobal
 * @param value
 */
ICItemArray::ICItemArray(bool isGlobal, int *value) :
        ICItem(ICItemType::Array),
        isConst(false),
        value(value),
        length(-1),
        isGlobal(isGlobal),
        arrayId(-1),
        tempArrayId(generateTempArrayId()),
        symbolTableEntry(nullptr),
        originalName(nullptr),
        isTemp(true) {
    if (!isGlobal) {
        // 初始化非全局变量的数组才会用到，数组每一个元素都需要通过临时变量来赋值
        itemsToInitArray = new std::vector<ICItemVar *>;
    } else {
        itemsToInitArray = nullptr;
    }
}

ICItemArray::~ICItemArray() {
    delete[] value;
    for (const auto *pItem: *itemsToInitArray) delete pItem;
    delete itemsToInitArray;
}

std::string ICItemArray::toString() const {
    return std::__cxx11::string();
}
