with Ada.Text_IO; use Ada.Text_IO;

with Ada.Strings.Unbounded;
with Menu;

procedure Hello is
    package SU renames Ada.Strings.Unbounded;

    M : Menu.T_Menu;
begin

    M.Title := SU.To_Unbounded_String("Voulez-vous vraiment faire ceci ?");

    Menu.T_Items.Append(M.Items, (Symbol => 'o',
                                  Name => SU.To_Unbounded_String("Oui"),
                                  Func => Hello'access));

    Menu.T_Items.Append(M.Items, (Symbol => 'n',
                                  Name => SU.To_Unbounded_String("Non"),
                                  Func => null));

    Menu.Query(M);

end Hello;
