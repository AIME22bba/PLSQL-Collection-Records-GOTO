-- collection_example.sql
-- Demonstrates PL/SQL Collections using menu items
-- Part of ADD'S CUISINE Smart Food Delivery System

SET SERVEROUTPUT ON;

DECLARE
    -- Define a collection type to store menu item names
    TYPE menu_collection IS TABLE OF VARCHAR2(50) INDEX BY PLS_INTEGER;
    
    -- Declare a variable of the collection type
    menu_items menu_collection;
    i NUMBER := 1;
BEGIN
    -- Load menu items into the collection
    menu_items(1) := 'Pizza';
    menu_items(2) := 'Burger';
    menu_items(3) := 'Chicken Wings';
    menu_items(4) := 'French Fries';
    menu_items(5) := 'Fresh Juice';

    DBMS_OUTPUT.PUT_LINE('--- ADD''S CUISINE MENU LIST ---');
    
    -- Loop through the collection and print each menu item
    WHILE menu_items.EXISTS(i) LOOP
        DBMS_OUTPUT.PUT_LINE('Menu Item #' || i || ': ' || menu_items(i));
        i := i + 1;
    END LOOP;
END;
/
