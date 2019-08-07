module Blocks.Base;
import Util.Instruction;
import Util.Gear;
import std.stdio : writeln;

class Variable
{
  ulong X;
  ulong Y;

  this(ulong Value)
  {
    Y = 0;
    X = Value;
  }

  this(ulong Value, ulong Y)
  {
    this.Y = Y;
    X = Value;
  }
}

class Block
{
  Instructions[] Ins;
  uint[] Exits;
  Gear!Variable CW;
  ushort PC = 0;

  this(Gear!Variable CW, uint[] Exits, Instructions[] Is)
  {
    this.CW = CW;
    this.Exits = Exits;
    this.Ins = Is;
  }

  void Execute()
  {
    for (; PC < this.Ins.length; PC++)
    {
      const auto Ins = this.Ins[PC];
      Instruction!Variable Fn = InFns[Ins];
      Fn.Fn(this, Fn.CW);
    }
  }

  unittest
  {
    import InsturctionSets.IAL : IAL;

    IAL();
    auto GG = new Gear!Variable(2);
    auto G = InFns[Instructions.Add].CW;
    G.Push(new Variable(1));
    G.Push(new Variable(2));
    assert(G.Peak.X == 2);
    auto B = new Block(GG, [], [Instructions.Add]);
    B.Execute();
    assert(GG.Peak.X == 3);

  }
}
