with Ada.Text_IO; use Ada.Text_IO;

with Ada.Strings.Unbounded;
with Menu;

procedure Example is
    package SU renames Ada.Strings.Unbounded;

    M : Menu.T_Menu;
begin

    M.Title := SU.To_Unbounded_String("Do you want to recurse?");

    Menu.Add_Item(M, (Symbol => 'y',
                      Name => SU.To_Unbounded_String("Yes"),
                      Func => Example'access));

    Menu.Add_Item(M, (Symbol => 'n',
                      Name => SU.To_Unbounded_String("No"),
                      Func => null));

    Menu.Add_Item(M, (Symbol => 'm',
                      Name => SU.To_Unbounded_String("Maybe"),
                      Func => null));

    Menu.Query(M);

end Example;
