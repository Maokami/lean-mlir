{
  ^entry(%0 : !i64, %a : !i64):
    %1 = "li"() {imm = 8 : !i64 } : (!i64) -> (!i64)
    %2 = "add"(%0, %1) : (!i64, !i64) -> (!i64)
    %3 = "sub"(%2, %2) : (!i64, !i64) -> (!i64)
    %4 = "mulu"(%2, %2) : (!i64, !i64) -> (!i64)
    %5 = "mulh"(%2, %2) : (!i64, !i64) -> (!i64)
    %6 = "mulhu"(%2, %2) : (!i64, !i64) -> (!i64)
    %7 = "mulhsu"(%2, %2) : (!i64, !i64) -> (!i64)
    %8 = "divu"(%2, %2) : (!i64, !i64) -> (!i64)
    %9 = "rol"(%2, %2) : (!i64, !i64) -> (!i64)
    %10 = "ror"(%2, %2) : (!i64, !i64) -> (!i64)
    %11 = "remwu"(%2, %2) : (!i64, !i64) -> (!i64)
    %12 = "remu"(%2, %2) : (!i64, !i64) -> (!i64)
    %22 = "addw"(%2, %2) : (!i64, !i64) -> (!i64)
    %23 = "subw"(%2, %2) : (!i64, !i64) -> (!i64)
    %24 = "sllw"(%2, %2) : (!i64, !i64) -> (!i64)
    %25 = "srlw"(%2, %2) : (!i64, !i64) -> (!i64)
    %26 = "sraw"(%2, %2) : (!i64, !i64) -> (!i64)
    %27 = "add"(%2, %2) : (!i64, !i64) -> (!i64)
    %28 = "slt"(%2, %2) : (!i64, !i64) -> (!i64)
    %29 = "sltu"(%2, %2) : (!i64, !i64) -> (!i64)
    %30 = "and"(%2, %2) : (!i64, !i64) -> (!i64)
    %31 = "or"(%2, %2) : (!i64, !i64) -> (!i64)
    %32 = "xor"(%2, %2) : (!i64, !i64) -> (!i64)
    %33 = "sll"(%2, %2) : (!i64, !i64) -> (!i64)
    %34 = "srl"(%2, %2) : (!i64, !i64) -> (!i64)
    %35 = "sub"(%2, %2) : (!i64, !i64) -> (!i64)
    %36 = "sra"(%2, %2) : (!i64, !i64) -> (!i64)
    %37 = "remw"(%2, %2) : (!i64, !i64) -> (!i64)
    %38 = "rem"(%2, %2) : (!i64, !i64) -> (!i64)
    %39 = "mul"(%2, %2) : (!i64, !i64) -> (!i64)
    %40 = "mulw"(%2, %2) : (!i64, !i64) -> (!i64)
    %41 = "div"(%2, %2) : (!i64, !i64) -> (!i64)
    %42 = "divw"(%2, %2) : (!i64, !i64) -> (!i64)
    %43 = "divwu"(%2, %2) : (!i64, !i64) -> (!i64)
    %50 = "czero.eqz"(%2, %2): (!i64, !i64) -> (!i64)
    %51 = "czero.nez"(%2, %2) : (!i64, !i64) -> (!i64)
    %52 = "sext.b"(%2) : (!i64) -> (!i64)
    %53 = "sext.h"(%2) : (!i64) -> (!i64)
    %54 = "zext.h"(%2) : (!i64) -> (!i64)
    %55 = "bclr"(%2, %2) : (!i64, !i64) -> (!i64)
    %56 = "bext"(%2, %2) : (!i64, !i64) -> (!i64)
    %57 = "binv"(%2, %2) : (!i64, !i64) -> (!i64)
    %58 = "bset"(%2, %2) : (!i64, !i64) -> (!i64)
    %63 = "rolw"(%2, %2) : (!i64, !i64) -> (!i64)
    %64 = "rorw"(%2, %2) : (!i64, !i64) -> (!i64)
    %65 = "add.uw"(%2, %2) : (!i64, !i64) -> (!i64)
    %66 = "sh1add.uw"(%2, %2) : (!i64, !i64) -> (!i64)
    %67 = "sh2add.uw"(%2, %2) : (!i64, !i64) -> (!i64)
    %68 = "sh3add.uw"(%2, %2) : (!i64, !i64) -> (!i64)
    %69 = "sh1add"(%2, %2) : (!i64, !i64) -> (!i64)
    %70 = "sh2add"(%2, %2) : (!i64, !i64) -> (!i64)
    %71 = "sh3add"(%2, %2) : (!i64, !i64) -> (!i64)
    "ret" (%71) : (!i64) -> ()
}

