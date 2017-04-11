Require Import util.
Require Import Coq.Lists.List.
Require Import Coq.Arith.Arith.
Require Import Coq.omega.Omega.
Import ListNotations.


Inductive aexp: Type :=
| ANum : nat -> aexp
| AId : id -> aexp
| APlus : aexp -> aexp -> aexp
| AMult : aexp -> aexp -> aexp
| AMinus : aexp -> aexp -> aexp
| AFsize : id -> aexp.


Inductive bkexp: Type :=
| BKNum : nat -> bkexp
| BKId  : id -> bkexp
| BKAddr: id -> aexp -> bkexp.

Inductive bexp: Type :=
| BTrue : bexp
| BFalse: bexp
| BEq : aexp -> aexp -> bexp
| BLe : aexp -> aexp -> bexp
| BNot : bexp -> bexp
| BAnd : bexp -> bexp -> bexp
| BOr  : bexp -> bexp -> bexp
| BKeq : bkexp -> bkexp -> bexp
| BKle : bkexp -> bkexp -> bexp.


Inductive command: Type :=
| CSkip   : command
| CAss    : id -> aexp -> command
| CSeq    : command -> command -> command
| CIf     : bexp  -> command -> command -> command
| CWhile  : bexp -> command -> command
| CCons   : id -> aexp -> command
| CLookup : id -> aexp -> command
| CMutat  : aexp -> aexp -> command
| CDispose: aexp -> command
| CFcreate : id -> list bkexp -> command
| CFcontentAppend: id -> list bkexp -> command
| CFAddressAppend: id -> id -> list bkexp -> command
| CFdelete : id -> command
| CBlookup: id -> bkexp -> command
| CBass   : id -> bkexp -> command
| CBmutat : bkexp -> bkexp -> command
| CBdelete: bkexp -> command.


Definition W : id := Id "W".
Definition X : id := Id "X".
Definition Y : id := Id "Y".
Definition Z : id := Id "Z".
Definition M : id := Id "M".
Definition N : id := Id "N".
Definition Fa : id := Id "Fa".
Definition Fb : id := Id "Fb".
Definition Fc : id := Id "Fc".
Definition Ba : id := Id "Ba".
Definition Bb : id := Id "Bb".
Definition Bc : id := Id "Bc".
Definition Bd : id := Id "Bd".
Definition Be : id := Id "Be".


