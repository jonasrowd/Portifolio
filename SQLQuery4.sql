DECLARE @xml XML
 
SET @xml= (SELECT TOP 1 XML FROM TESTE WHERE INTEGRADO=0 FOR XML PATH);
 
-- Method #1: Query nested XML nodes by traversing backward and forward.
-- Query Cost: 81%
/*
select
    Tab.Col.value('../@ID', 'int') as OrderHDR_ID,
    Tab.Col.value('../custID[1]', 'int') as Cust_ID,
    Tab.Col.value('@ID', 'int') as OrderDTL_ID,
    Tab.Col.value('prodID[1]', 'int') as Prod_ID,
    Tab.Col.value('qty[1]', 'int') as QTY,
    Tab.Col.value('cost[1]', 'float') as Cost,
    Tab.Col.value('count(../orderDTL)', 'int') as Cust_Ord_Count
from @xml.nodes('/row/XML') Tab(Col)*/
 
-- Method #2: Query nested XML nodes by using CROSS APPLY on appropriate node.
-- Query Cost: 19%
DECLARE @XML NCHAR(500)
SET @XML = (SELECT CAST(XML AS NCHAR(500))  FROM TESTE)
SELECT XML.value('(./CABECALHO)[2]', 'NCHAR(500)') FROM TESTE 




DECLARE @bikes XML
SET @bikes = (SELECT XML FROM TESTE);
SELECT 
  TESTE.query('./CABECALHO()')
    AS BikeTypes
FROM 
  @bikes.nodes('/CABECALHO') 
    AS Bike(Category);

<CABECALHO>01</CABECALHO><PEDIDO_CLIENTE>21434007</PEDIDO_CLIENTE><CNPJ_CLIENTE>43965573000162</CNPJ_CLIENTE><CNPJ_FORNECEDOR>14222555000158</CNPJ_FORNECEDOR><DATA>18102018</DATA><PLANO_PAG>0</PLANO_PAG><END_ENTREGA>0</END_ENTREGA>