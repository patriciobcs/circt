module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>>, llvm.data_layout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-apple-macosx13.0.0", "polygeist.target-cpu" = "penryn", "polygeist.target-features" = "+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87", "polygeist.tune-cpu" = "generic"} {
  func.func @intconstdiv(%arg0: i32) attributes {llvm.linkage = #llvm.linkage<external>} {
    %alloca = memref.alloca() : memref<1xi32>
    %cast = memref.cast %alloca : memref<1xi32> to memref<?xi32>
    %c0 = arith.constant 0 : index
    %0 = llvm.mlir.undef : i32
    memref.store %0, %cast[%c0] : memref<?xi32>
    %alloca_0 = memref.alloca() : memref<1xi32>
    %cast_1 = memref.cast %alloca_0 : memref<1xi32> to memref<?xi32>
    %c0_2 = arith.constant 0 : index
    %1 = llvm.mlir.undef : i32
    memref.store %1, %cast_1[%c0_2] : memref<?xi32>
    %c0_3 = arith.constant 0 : index
    memref.store %arg0, %cast_1[%c0_3] : memref<?xi32>
    %true = arith.constant true
    %alloca_4 = memref.alloca() : memref<i1>
    %alloca_5 = memref.alloca() : memref<i1>
    memref.store %true, %alloca_5[] : memref<i1>
    memref.store %true, %alloca_4[] : memref<i1>
    %2 = memref.load %alloca_4[] : memref<i1>
    scf.if %2 {
      scf.execute_region {
        %3 = memref.load %alloca_4[] : memref<i1>
        scf.if %3 {
          scf.execute_region {
            %c0_6 = arith.constant 0 : index
            %4 = memref.load %cast_1[%c0_6] : memref<?xi32>
            %c3_i32 = arith.constant 3 : i32
            %5 = arith.divsi %4, %c3_i32 : i32
            %c0_7 = arith.constant 0 : index
            memref.store %5, %cast[%c0_7] : memref<?xi32>
            scf.yield
          }
        }
        scf.yield
      }
    }
    return
  }
}