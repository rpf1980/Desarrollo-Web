<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- 
  Fichero: e1-transforma.xsl
  Alumno: 
-->
  <xsl:template match="/proyecto">
    <html>
      <head>
        <!--Hoja de estilos-->
        <link rel="stylesheet" type="text/css" href="e1-estilos.css"/>
      </head>
      <body>
        <!--Definimos título-->
        <h1>
      Proyecto: <xsl:value-of select="datos_proyecto/titulo"/>
    </h1>
        <!--Seleccionamos los atributos del elemento proyecto con @-->
        <p>
      Codigo idioma: <xsl:value-of select="proyecto/@lang"/>
    </p>
        <!--Para los autores necesitamos un bucle-->
        <p>
      Autores:
      <xsl:for-each select="datos_proyecto/autor"><xsl:value-of select="nombre"/><xsl:value-of select="apellidos"/></xsl:for-each>
    </p>
        <!--Lista ordenada de elementos seleccionados con un bucle-->
        <ol>
          <xsl:for-each select="apartado">
            <li>
              <xsl:value-of select="titulo"/>
            </li>
          </xsl:for-each>
        </ol>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
