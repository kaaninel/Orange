module Util.Instruction;
import std.stdio;
import Blocks.Base : Block, Variable, VG;
import Util.Gear;

enum Instructions {
  Add,
  Sub,
  Mul,
  Div,
  LoadIG,
  LoadBG,
  LeftIG,
  LeftBG,
  RightIG,
  RightBG
}

alias InstructionFn = bool function(Block Blk, VG);
struct Instruction(T) {
  Instructions Key;
  InstructionFn Fn;
}

Gear!Variable[Instructions] InGs;
Instruction!Variable[Instructions] InFns;

void AddInstruction(Instructions I, InstructionFn Fn, VG G) {

  InFns[I] = Instruction!Variable(I, Fn);
  InGs[I] = G;
}
