<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:acc="http://www.tracfone.com/AccountCommonTypes"
    xmlns:run="http://www.tracfone.com/RuntimeFault" xmlns:com="http://www.tracfone.com/CommonTypes"
    xmlns:mob="http://b2b.tracfone.com/MobileAccountServices" version="1.0"
    exclude-result-prefixes="run com acc">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>
    <xsl:variable name="Root" select="//*[local-name()='getTransactionHistoryResponse']"/>
    <xsl:param name="offset"/>
    <xsl:param name="limit"/>
    <xsl:variable name="total_count">
        <xsl:value-of
            select="count($Root/*[local-name()='transactionList']/*[local-name()='transaction'])"/>
    </xsl:variable>
    <xsl:template match="/">
        <mob:getTransactionHistoryResponse>
            <com:requestToken>
                <com:clientTransactionId>
                    <xsl:value-of
                        select="$Root/*[local-name()='requestToken']/*[local-name()='clientTransactionId']"
                    />
                </com:clientTransactionId>
                <com:clientId>
                    <xsl:value-of
                        select="$Root/*[local-name()='requestToken']/*[local-name()='clientId']"/>
                </com:clientId>
            </com:requestToken>
            <com:result>
                <com:code>
                    <xsl:value-of select="$Root/*[local-name()='result']/*[local-name()='code']"/>
                </com:code>
                <com:message>
                    <xsl:value-of select="$Root/*[local-name()='result']/*[local-name()='message']"
                    />
                </com:message>
            </com:result>
            <com:serverTransactionId>
                <xsl:value-of select="$Root/*[local-name()='serverTransactionId']"/>
            </com:serverTransactionId>
            <mob:totalTransactions>
                <xsl:value-of select="count($Root/*[local-name()='transactionList']/*[local-name()='transaction'])"/>
            </mob:totalTransactions>
            <mob:transactionList>
                <xsl:for-each
                    select="$Root/*[local-name()='transactionList']/*[local-name()='transaction']">
                    <xsl:sort order="descending"
                        select="./*[local-name()='trasactionInfo']/*[local-name()='transactionDate']"/>
                    <xsl:choose>
                        <xsl:when test="$offset !='' and $limit !=''">
                            <xsl:if
                                test="($total_count &lt; $offset or position() &gt;= $offset) and (position() &lt; $offset + $limit)">
                                <xsl:call-template name="transaction"/>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="$offset ='' and $limit =''">
                            <xsl:call-template name="transaction"/>
                        </xsl:when>
                        <xsl:when test="$offset ='' or $limit =''">
                            <xsl:if
                                test="($offset='') and(position() &gt;='1' and position() &lt; (1 + $limit))">
                                <xsl:call-template name="transaction"/>
                            </xsl:if>
                            <xsl:if test="($limit='') and (position()&gt;= $offset)">
                                <xsl:call-template name="transaction"/>
                            </xsl:if>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </mob:transactionList>
        </mob:getTransactionHistoryResponse>
    </xsl:template>
    <xsl:template name="transaction">
        <mob:transaction>
            <mob:trasactionInfo>
                <acc:transactionDate>
                    <xsl:value-of
                        select="./*[local-name()='trasactionInfo']/*[local-name()='transactionDate']"
                    />
                </acc:transactionDate>
                <acc:transactionType>
                    <xsl:value-of
                        select="./*[local-name()='trasactionInfo']/*[local-name()='transactionType']"
                    />
                </acc:transactionType>
                <acc:transactionTotal>
                    <xsl:value-of
                        select="./*[local-name()='trasactionInfo']/*[local-name()='transactionTotal']"
                    />
                </acc:transactionTotal>
                <acc:transactionId>
                    <xsl:value-of
                        select="./*[local-name()='trasactionInfo']/*[local-name()='transactionId']"
                    />
                </acc:transactionId>
                 <acc:transactionStatus>
                    <xsl:value-of
                        select="./*[local-name()='trasactionInfo']/*[local-name()='transactionStatus']"
                    />
                </acc:transactionStatus>
            </mob:trasactionInfo>
            <mob:paymentSource>
                <acc:paymentSourceNickname>
                    <xsl:value-of
                        select="./*[local-name()='paymentSource']/*[local-name()='paymentSourceNickname']"
                    />
                </acc:paymentSourceNickname>
                <acc:paymentSourceType>
                    <xsl:value-of
                        select="./*[local-name()='paymentSource']/*[local-name()='paymentSourceType']"
                    />
                </acc:paymentSourceType>
                <acc:paymentSourceNumberMask>
                    <xsl:value-of
                        select="./*[local-name()='paymentSource']/*[local-name()='paymentSourceNumberMask']"
                    />
                </acc:paymentSourceNumberMask>
            </mob:paymentSource>
            <mob:device>
                <acc:deviceNickName>
                    <xsl:value-of
                        select="./*[local-name()='device']/*[local-name()='deviceNickName']"/>
                </acc:deviceNickName>
                <acc:min>
                    <xsl:value-of select="./*[local-name()='device']/*[local-name()='min']"/>
                </acc:min>
            </mob:device>
        </mob:transaction>
    </xsl:template>
</xsl:stylesheet>