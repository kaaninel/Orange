module Util.Gear;

struct Gear(T) {
  uint Size;
  uint Loc = 0;
  T[] Fields;

  this(uint Size) {
    this.Size = Size;
    Fields = new T[Size];
  }

  void Right() {
    Loc = (Loc - 1) % Size;
  }

  void Left() {
    Loc = (Loc + 1) % Size;
  }

  void Push(T Value) {
    Left();
    Fields[this.Loc] = Value;
  }

  T Pop() {
    auto Tmp = Fields[this.Loc];
    Right();
    return Tmp;
  }

  T Peak() {
    return Fields[this.Loc];
  }
}

unittest {
  auto G = new Gear!int(4);
  G.Push(1);
  G.Push(2);
  G.Push(3);
  G.Push(4);
  assert(G.Peak == 4);
  G.Right();
  assert(G.Peak == 3);
  G.Left();
  G.Left();
  assert(G.Peak == 1);
  G.Push(5);
  assert(G.Peak == 5);
  G.Right();
  assert(G.Pop() == 1);
  assert(G.Pop() == 4);
  assert(G.Pop() == 3);
  assert(G.Pop() == 5);

}
