#ifndef IC_ENTRY_TYPE_H
#define IC_ENTRY_TYPE_H

enum class ICEntryType {
    // 第一次代码生成作业:
    VarDefine,
    ConstVarDefine,

    ArrayDefine,
    ConstArrayDefine,

    FuncDefine,
    FuncCall,
    FuncReturnWithValue,
    FuncReturn,

    MainFuncStart,
    MainFuncEnd,

    Getint,
    Print,
    Assign,
    Add,
    Sub,
    Mul,
    Div,
    Mod,
    Not,
    Neg,
    // 第二次代码生成作业:
    Or,
    And,
    Equal,
    NotEqual,
    LessEqual,
    LessThan,
    GreaterThan,
    GreaterEqual,

    Beqz,
    Bnez,
    InsertLabel,
    JumpLabel,

    Bitand

};

#endif //IC_ENTRY_TYPE_H
