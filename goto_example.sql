-- goto_example.sql
-- Demonstrates PL/SQL GOTO usage to control order validation logic
-- Part of ADD'S CUISINE Smart Food Delivery System

SET SERVEROUTPUT ON;

DECLARE
    -- sample order (invalid quantity triggers GOTO)
    order_id NUMBER := 201;
    order_quantity NUMBER := 0;  -- change to test different flows
    customer_name VARCHAR2(100) := 'Martha';
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- ORDER VALIDATION PROCESS ---');
    DBMS_OUTPUT.PUT_LINE('Processing Order ID: ' || order_id || ' for ' || customer_name);

    -- Validate quantity
    IF order_quantity < 1 THEN
        GOTO invalid_order;
    END IF;

    -- Normal processing (would assign staff, update status, etc.)
    DBMS_OUTPUT.PUT_LINE('Order accepted. Quantity: ' || order_quantity);
    GOTO end_process;

    <<invalid_order>>
    -- Jumps here when quantity invalid
    DBMS_OUTPUT.PUT_LINE('ERROR: Invalid quantity (' || order_quantity || ') for Order ID ' || order_id || '.');
    DBMS_OUTPUT.PUT_LINE('Action: Mark order as "Invalid" or request correction from customer.');

    <<end_process>>
    DBMS_OUTPUT.PUT_LINE('Order validation finished for Order ID: ' || order_id);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/
