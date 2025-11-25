
-- record_example.sql
-- Demonstrates PL/SQL RECORD type for storing customer order information
-- Part of ADD'S CUISINE Smart Food Delivery System

SET SERVEROUTPUT ON;

DECLARE
    -- Define a record type for a single customer order
    TYPE order_record IS RECORD (
        order_id        NUMBER,
        customer_name   VARCHAR2(50),
        food_item       VARCHAR2(50),
        quantity        NUMBER,
        status          VARCHAR2(20)
    );

    -- Declare a variable of the record type
    order_data order_record;
BEGIN
    -- Assign values to the record fields
    order_data.order_id := 101;
    order_data.customer_name := 'John Doe';
    order_data.food_item := 'Pizza';
    order_data.quantity := 2;
    order_data.status := 'Pending';

    -- Display order details using DBMS_OUTPUT
    DBMS_OUTPUT.PUT_LINE('--- CUSTOMER ORDER DETAILS ---');
    DBMS_OUTPUT.PUT_LINE('Order ID: ' || order_data.order_id);
    DBMS_OUTPUT.PUT_LINE('Customer Name: ' || order_data.customer_name);
    DBMS_OUTPUT.PUT_LINE('Food Item: ' || order_data.food_item);
    DBMS_OUTPUT.PUT_LINE('Quantity: ' || order_data.quantity);
    DBMS_OUTPUT.PUT_LINE('Status: ' || order_data.status);
END;
/
