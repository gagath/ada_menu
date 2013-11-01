with Ada.Text_IO; use Ada.Text_IO;

package body Menu is

    procedure Add_Item(M : in out T_Menu; Item : T_Item) is
    begin
        T_Items.Append(M.Items, Item);
    end;

    procedure Show(M : in T_Menu) is
        Item  : T_Item;
        First : T_Items.Extended_Index := T_Items.First_Index(M.Items);
        Last  : T_Items.Extended_Index := T_Items.Last_Index(M.Items);
    begin
        Put_Line(SU.To_String(M.Title));
        New_Line;

        for I in First..Last loop
            Item := T_Items.Element(M.Items, I);
            Put_Line(" (" & Item.Symbol & ") " & SU.To_String(Item.Name));
        end loop;

        New_Line;
    end;

    procedure Query(M : in T_Menu) is
        Response : Character;

        Item  : T_Item;
        First : T_Items.Extended_Index := T_Items.First_Index(M.Items);
        Last  : T_Items.Extended_Index := T_Items.Last_Index(M.Items);

        Found : Boolean := False;
    begin
        while not Found loop
            Show(M);
            Put("> ");
            Get(Response);

            for I in First..Last loop
                Item := T_Items.Element(M.Items, I);

                -- If we got existing symbol and the func does exists, call it
                if Item.Symbol = Response then
                    if Item.Func /= null then                
                        Item.Func.all;
                    end if;
                    Found := True;
                    exit;
                end if;
            end loop;
            if not Found then
                Put_Line("Bad answer !");
                Put_Line("Please answer an existing choice.");
            end if;
        end loop;
    end;

end Menu;
