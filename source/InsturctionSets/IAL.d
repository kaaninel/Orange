module InsturctionSets.IAL;
import Util.Instruction;
import Blocks.Base;
import Util.Gear;
import std.stdio;

bool Add(Block Blk, Gear!Variable G)
{
  Variable a = G.Pop();
  Variable b = G.Pop();
  a.writeln;
  Blk.CW.Push(new Variable(a.X + b.X));
  return true;
}

void IAL()
{
  InFns[Instructions.Add] = Instruction!Variable(Instructions.Add, &Add, new Gear!Variable(2));

}

unittest
{
  IAL();
}
