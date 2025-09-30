/*
Problem Statement:
You are given a table, BST, containing two columns: N and P, where N represents the value of a node
in a Binary Tree, and P is the parent of N.
Write a query to find the node type of Binary Tree ordered by the value of the node.
Output one of the following for each node:
• Root: If the node is a root node (P is NULL).
• Leaf: If the node is a leaf node (N is not a parent to any other node).
• Inner: If the node is neither a root nor a leaf node.

Table Schema (BST):
+--------+-----------+
| Column | Type      |
+--------+-----------+
| N      | Integer   |
| P      | Integer   |
+--------+-----------+

Language: MySQL
*/

-- MySQL Query: Classify nodes using UNION and subqueries
SELECT
    Binary_Tree.node
FROM
(
    -- 1. Root Nodes: Parent (P) is NULL
    SELECT
        CONCAT(BST.N, ' Root') AS node,
        BST.N AS sort_order
    FROM
        BST
    WHERE
        BST.P IS NULL

    UNION

    -- 2. Inner Nodes: Node (N) appears as a Parent (P) AND has a Parent (P) itself
    SELECT
        CONCAT(BST.N, ' Inner') AS node,
        BST.N AS sort_order
    FROM
        BST
    WHERE
        BST.N IN (SELECT BST.P FROM BST WHERE BST.P IS NOT NULL)
        AND BST.P IS NOT NULL

    UNION

    -- 3. Leaf Nodes: Node (N) does NOT appear as a Parent (P)
    SELECT
        CONCAT(BST.N, ' Leaf') AS node,
        BST.N AS sort_order
    FROM
        BST
    WHERE
        BST.N NOT IN (SELECT BST.P FROM BST WHERE BST.P IS NOT NULL)
) AS Binary_Tree
ORDER BY
    Binary_Tree.sort_order ASC;