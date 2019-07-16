DECLARE @idoc int, @doc varchar(1000);   
SET @doc = (SELECT TOP 1 XML FROM TESTE1 WHERE INTEGRADO=0 FOR XML PATH);  
  
--Create an internal representation of the XML document.  
EXEC sp_xml_preparedocument @idoc OUTPUT, @doc;   
  
-- SELECT statement that uses the OPENXML rowset provider.  
SELECT    *
FROM       OPENXML (@idoc, '.') WHERE PARENTID>2
DECLARE @XML VARCHAR(MAX)
SET @XML = (SELECT TOP 1 CAST(XML AS NCHAR(500))  FROM TESTE)
SELECT TOP 1 CAST(XML.query('DETALHE') AS NCHAR(500)),char(13)+char(10) FROM TESTE1




CAST(CONCAT(CABECALHO,PEDIDO_CLIENTE,CODCLIENTE,CNPJCLIENTE,CNPJFORNEC,DATA_PEDIDO,PLANO_PAG,COD_END,char(13)+char(10),
DETALHE,TIPO_PROD,IDT_PRO,COND_COM,EMBALAGEM,QTD_PEDIDO,VR_UNITARIO,DESC_ITEM,ICMS,DESC_COM,char(13)+char(10),
RODAPE,COUNT_ITENS,SUM_QTD,SUM_VLR_TOTAL,OBS_NOTA,OBS_INTERNA)AS TEXT) AS RESULT

<DETALHE>02</DETALHE><DETALHE>02</DETALHE><DETALHE>02</DETALHE><DETALHE>02</DETALHE><DETALHE>02</DETALHE>                                                                                                                                                                                                                                                                                                                                                                                                           

DECLARE name_cursor CURSOR  
FOR  
  SELECT    *
FROM       OPENXML (@idoc, '.') WHERE PARENTID>2
OPEN name_cursor  
DECLARE @CABEC VARCHAR(MAX)  
DECLARE @idoc int  
FETCH NEXT FROM name_cursor INTO @xmlVal  
  
WHILE (@@FETCH_STATUS = 0)  
BEGIN  
   EXEC sp_xml_preparedocument @idoc OUTPUT, @xmlVal  
   SELECT   *  
   FROM   OPENXML (@idoc, '//CACECALHO')  
          WITH (FirstName  varchar(50) 'DETALHE',  
                LastName   varchar(50) 'REGISTRO') R  
  
  
   EXEC sp_xml_removedocument @idoc  
   FETCH NEXT FROM name_cursor INTO @xmlVal  
END  
CLOSE name_cursor  
DEALLOCATE name_cursor   
EXEC sp_xml_removedocument @idoc ; 
