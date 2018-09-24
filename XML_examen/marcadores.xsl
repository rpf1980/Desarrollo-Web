<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/marcadores">
    <!--Construimos HTML-->
    <html>
      <head>
        <link rel="stylesheet" href="css/estilos-xsl.css"/>
      </head>
      <body>
        <!--TITULO de la página-->
        <h1>Marcadores de <xsl:value-of select="creador"/></h1>
        <!--Usamos bucle para mostrar usuarios después del título-->
        <p>
          Compartido con 
          <xsl:for-each select="compartido/usuario"><xsl:if test=". !=last()"> - </xsl:if><xsl:value-of select="."/></xsl:for-each>
        </p>
        <!--Construimos la tabla-->
        <table>
          <tr>
            <th>Código</th>
            <th>Logo</th>
            <th>Puntos</th>
            <th>Nombre y enlace</th>
            <th>Categoría</th>
            <th>Descripción</th>
          </tr>
          <!--Bucle para mostrar las FILAS DE LA TABLA-->
          <xsl:for-each select="pagina">
            <!--Odenamos las páginas por puntuación-->
            <xsl:sort select="puntuacion" data-type="number" order="descending"/>
            <!--Mostramos las PAGINAS-->
            <!--CONDICION categoria (Senderos -  Abrirllave)-->
            <tr>
              <!--Columna códigos-->
              <th scope="row">
                <xsl:value-of select="@codigo"/>
              </th>
              <!--Columna imágenes-->
              <td>
                <img src="figuras/{logo}" alt="logo"/>
              </td>
              <!--Columna puntuación-->
              <td>
                <xsl:value-of select="puntuacion"/>
              </td>
              <!--Columna enlaces-->
              <td>
                <a href="{url}">
                  <xsl:value-of select="nombre"/>
                </a>
              </td>
              <!--Columna categorias-->
              <td>
                <ul>
                  <xsl:for-each select="categorias/etiqueta">
                    <li>
                      <xsl:value-of select="."/>
                    </li>
                  </xsl:for-each>
                </ul>
              </td>
              <!--Columna descripcion-->
              <td>
                <xsl:for-each select="descripcion">
                <p class="{@idioma}">
                  <xsl:value-of select="."/>
                </p>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
