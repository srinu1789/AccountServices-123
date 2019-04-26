<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:acct="http://www.tracfone.com/AccountCommonTypes"
    xmlns:run="http://www.tracfone.com/RuntimeFault" xmlns:com="http://www.tracfone.com/CommonTypes"
    xmlns:spct="http://www.tracfone.com/ServicePlanCommonTypes"
    xmlns:mob="http://b2b.tracfone.com/MobileAccountServices/v2" version="1.0"
    exclude-result-prefixes="run com acct spct">
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
            <!-- This result block is missing in xquery -->
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
                <xsl:value-of select="$Root/*[local-name()='totalTransactions']"/>
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
                <acct:transactionDate>
                    <xsl:value-of
                        select="./*[local-name()='trasactionInfo']/*[local-name()='transactionDate']"
                    />
                </acct:transactionDate>
                <acct:transactionType>
                    <xsl:value-of
                        select="./*[local-name()='trasactionInfo']/*[local-name()='transactionType']"
                    />
                </acct:transactionType>
                <acct:transactionId>
                    <xsl:value-of
                        select="./*[local-name()='trasactionInfo']/*[local-name()='transactionId']"
                    />
                </acct:transactionId>
            </mob:trasactionInfo>
            <xsl:if test="./*[local-name()='servicePlanInfo']">
                <xsl:copy-of select="./*[local-name()='servicePlanInfo']"/>
            </xsl:if>
            <mob:device>
                <acct:deviceNickName>
                    <xsl:value-of
                        select="./*[local-name()='device']/*[local-name()='deviceNickName']"/>
                </acct:deviceNickName>
                <acct:min>
                    <xsl:value-of select="./*[local-name()='device']/*[local-name()='min']"/>
                </acct:min>
                <xsl:if test="./*[local-name()='device']/*[local-name()='esn']">
                    <xsl:copy-of select="./*[local-name()='device']/*[local-name()='esn']"/>
                </xsl:if>
            </mob:device>
             <mob:group>
                <mob:groupId>
                    <xsl:value-of
                        select="./*[local-name()='group']/*[local-name()='groupId']"/>
                </mob:groupId>
                <mob:groupName>
                    <xsl:value-of select="./*[local-name()='group']/*[local-name()='groupName']"/>
                </mob:groupName>
             
            </mob:group>
        </mob:transaction>
    </xsl:template>
</xsl:stylesheet>