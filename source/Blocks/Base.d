module Blocks.Base;
import Util.Instruction;
import Util.Gear;

import std.stdio : writeln;

struct Variable {
  ulong X;
  ulong Y;

  this(ulong Value) {
    Y = 0;
    X = Value;
  }

  this(ulong Value, ulong Y) {
    this.Y = Y;
    X = Value;
  }
}

alias VG = Gear!Variable;

class Block {
  Instructions[] Ins;
  uint[] Exits;
  VG CW;
  ushort PC = 0;

  this(uint Size, uint[] Exits, Instructions[] Is) {
    this.CW = VG(Size);
    this.Exits = Exits;
    this.Ins = Is;
  }

  void Execute() {
    for (; PC < this.Ins.length; PC++) {
      const auto Ins = this.Ins[PC];
      Instruction!Variable Fn = InFns[Ins];
      Fn.Fn(this, InGs[Ins]);
    }
  }

  unittest {
    import InsturctionSets.IAL : IAL;

    with (Instructions) {
      IAL();
      auto B = new Block(3, [], [LoadIG, LoadIG, Add]);
      B.CW.Push(Variable(1, Add));
      B.CW.Push(Variable(2, Add));
      B.Execute();
      B.CW.Peak.X.writeln;
      assert(B.CW.Peak.X == 3);
    }

  }
}
