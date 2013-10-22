with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;

package Menu is

    -- More convenient way to access unbounded strings
    package SU renames Ada.Strings.Unbounded;

    -- Access to procedure to call for items
    type T_Func_Ptr is access procedure;

    -- An item in the menu
    type T_Item is
    record
        Symbol : Character;
        Name   : SU.Unbounded_String;
        Func   : T_Func_Ptr;
    end record;

    -- A collection of items
    package T_Items is new Ada.Containers.Vectors
        (Element_Type => T_Item,
         Index_Type   => Natural);

    -- A menu
    type T_Menu is
    record
        Title : SU.Unbounded_String;
        Items : T_Items.Vector;
    end record;

    -- Show a menu's title and all of its items
    procedure Show(M : in T_Menu);

    -- Show a menu, ask answer and call corresponding func
    procedure Query(M : in T_Menu);

end Menu;
