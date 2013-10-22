with Ada.Text_IO; use Ada.Text_IO;

package body Menu is

    procedure Show(M : in T_Menu) is
        Item  : T_Item;
        First : T_Items.Extended_Index := T_Items.First_Index(M.Items);
        Last  : T_Items.Extended_Index := T_Items.Last_Index(M.Items);
    begin
        Put_Line("> " & SU.To_String(M.Title));
        New_Line;

        for I in First..Last loop
            Item := T_Items.Element(M.Items, I);
            Put_Line(" (" & Item.Symbol & ") " & SU.To_String(Item.Name));
        end loop;

        New_Line;
    end;

    procedure Query(M : in T_Menu) is
    begin
        Show(M);
    end;

end Menu;
