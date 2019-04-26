<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:acc="http://www.tracfone.com/AccountCommonTypes"
    xmlns:run="http://www.tracfone.com/RuntimeFault" xmlns:com="http://www.tracfone.com/CommonTypes"
    xmlns:mob="http://b2b.tracfone.com/MobileAccountServices" version="1.0"
    exclude-result-prefixes="run com acc">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>
    <xsl:variable name="Root" select="//*[local-name()='getPaymentHistoryResponse']"/>
    <xsl:param name="offset"/>
    <xsl:param name="limit"/>
    <xsl:variable name="total_count">
        <xsl:value-of
            select="count($Root/*[local-name()='transactionList']/*[local-name()='transaction'])"/>
    </xsl:variable>
    <xsl:template match="/">
        <mob:getPaymentHistoryResponse>
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
        </mob:getPaymentHistoryResponse>
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
                <acc:discountTotal>
                    <xsl:value-of
                        select="./*[local-name()='trasactionInfo']/*[local-name()='discountTotal']"
                    />
                </acc:discountTotal>
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
                <acc:transactionTotalWithoutDiscountAndTax>
                    <xsl:value-of
                        select="./*[local-name()='trasactionInfo']/*[local-name()='transactionTotalWithoutDiscountAndTax']"
                    />
                </acc:transactionTotalWithoutDiscountAndTax>
                <acc:transactionChannel>
                    <xsl:value-of
                        select="./*[local-name()='trasactionInfo']/*[local-name()='transactionChannel']"
                    />
                </acc:transactionChannel>
            </mob:trasactionInfo>
            <mob:taxInfo>
                <acc:e911TaxAmount>
                    <xsl:value-of
                        select="./*[local-name()='taxInfo']/*[local-name()='e911TaxAmount']"
                    />
                </acc:e911TaxAmount>
                <acc:rcrfTaxAmount>
                    <xsl:value-of
                        select="./*[local-name()='taxInfo']/*[local-name()='rcrfTaxAmount']"
                    />
                </acc:rcrfTaxAmount>
                <acc:combsTaxAmount>
                    <xsl:value-of
                        select="./*[local-name()='taxInfo']/*[local-name()='combsTaxAmount']"
                    />
                </acc:combsTaxAmount>
                 <acc:usfTaxAmount>
                    <xsl:value-of
                        select="./*[local-name()='taxInfo']/*[local-name()='usfTaxAmount']"
                    />
                </acc:usfTaxAmount>
                <acc:totalTaxAmount>
                    <xsl:value-of
                        select="./*[local-name()='taxInfo']/*[local-name()='totalTaxAmount']"
                    />
                </acc:totalTaxAmount>
                <acc:totalAmountWithTaxes>
                    <xsl:value-of
                        select="./*[local-name()='taxInfo']/*[local-name()='totalAmountWithTaxes']"
                    />
                </acc:totalAmountWithTaxes>
            </mob:taxInfo>
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
            <mob:group>
	                    <mob:groupName>
	                        <xsl:value-of
	                            select="./*[local-name()='group']/*[local-name()='groupName']"/>
	                    </mob:groupName>
	              
            </mob:group>
            
        </mob:transaction>
    </xsl:template>
</xsl:stylesheet>