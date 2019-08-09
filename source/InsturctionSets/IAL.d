module InsturctionSets.IAL;
import Util.Instruction;
import Blocks.Base;
import Util.Gear;
import std.stdio;

bool Add(Block Blk, VG G) {
  Variable a = G.Pop();
  Variable b = G.Pop();
  Blk.CW.Push(Variable(a.X + b.X));
  return true;
}

bool LoadIG(Block Blk, VG G) {
  Variable a = Blk.CW.Pop();
  InGs[cast(Instructions) a.Y].Push(Variable(a.X));
  return true;
}
/*
bool LoadBG(Block Blk, VG G) {
  Blk.CW.Push(G.Pop());
  return true;
}

bool LeftBG(Block Blk, VG G) {
  Blk.CW.Left();
  return true;
}

bool RightBG(Block Blk, VG G) {
  Blk.CW.Right();
  return true;
}

bool LeftIG(Block Blk, VG G) {
  G.Left();
  return true;
}

bool RightIG(Block Blk, VG G) {
  G.Right();
  return true;
}*/

void IAL() {
  AddInstruction(Instructions.Add, &Add, VG(2));
  AddInstruction(Instructions.LoadIG, &LoadIG, VG(0));
  //InFns[Instructions.LoadIG] = Instruction!Variable(Instructions.LoadIG, &LoadIG, null);
  //InFns[Instructions.Add] = Instruction!Variable(Instructions.Add, &Add, new VG(2));
  //InFns[Instructions.Add] = Instruction!Variable(Instructions.Add, &Add, new VG(2));

}

unittest {
  IAL();
}
