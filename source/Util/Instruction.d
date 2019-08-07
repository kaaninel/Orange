module Util.Instruction;
import std.stdio;
import Blocks.Base : Block, Variable;
import Util.Gear;

enum Instructions
{
  Add,
  Sub,
  Mul,
  Div
}

alias InstructionFn = bool function(Block Blk, Gear!Variable);
struct Instruction(T)
{
  Instructions Key;
  InstructionFn Fn;
  Gear!T CW;
}

Instruction!Variable[Instructions] InFns;
