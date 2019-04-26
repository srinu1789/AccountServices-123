xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)
declare namespace ns1="http://www.tracfone.com/AccountDataServices";
(:: import schema at "../../DataServices/xsd/AccountDataServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";
declare namespace run = "http://www.tracfone.com/RuntimeFault";

declare variable $getTimeAsCustomerResponse as element() (:: schema-element(ns1:getTimeAsCustomerResponse) ::) external;

declare function local:GetTimeAsCustomerResponse($getTimeAsCustomerResponse as element() (:: schema-element(ns1:getTimeAsCustomerResponse) ::)) as element() (:: schema-element(ns2:getTimeAsCustomerResponse) ::) {
    <ns2:getTimeAsCustomerResponse>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($getTimeAsCustomerResponse/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($getTimeAsCustomerResponse/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        {
            if (count($getTimeAsCustomerResponse/com:result/com:code)>0 and fn:string-length($getTimeAsCustomerResponse/com:result/com:code) > 0 and fn:data($getTimeAsCustomerResponse/com:result/com:code)='-99')
            then (<com:result>
                    <com:code>{ fn:data('999') }</com:code>
                    <com:message>{ fn:data('Score Code cannot be retrieved') }</com:message>
                </com:result>)
            else (if (count($getTimeAsCustomerResponse/com:result/com:code)>0 and fn:string-length($getTimeAsCustomerResponse/com:result/com:code) > 0)
            then (<com:result>
                    <com:code>{ fn:data($getTimeAsCustomerResponse/com:result/com:code) }</com:code>
                    <com:message>{ fn:data($getTimeAsCustomerResponse/com:result/com:message) }</com:message>
                </com:result>)
            else (<com:result>
                    <com:code>{ fn:data('999') }</com:code>
                    <com:message>{ fn:data('Score Code cannot be retrieved') }</com:message>
                </com:result>))
        }
             <com:serverTransactionId>{fn:data($getTimeAsCustomerResponse/com:serverTransactionId)}</com:serverTransactionId>
        {
            if ($getTimeAsCustomerResponse/run:RuntimeFaultMessage)
            then 
                <run:RuntimeFaultMessage>
                    <run:code>{fn:data($getTimeAsCustomerResponse/run:RuntimeFaultMessage/run:code)}</run:code>
                    <run:subcode>{fn:data($getTimeAsCustomerResponse/run:RuntimeFaultMessage/run:subcode)}</run:subcode>
                    <run:isRetriable>{fn:data($getTimeAsCustomerResponse/run:RuntimeFaultMessage/run:isRetriable)}</run:isRetriable>
                    <run:summary>{fn:data($getTimeAsCustomerResponse/run:RuntimeFaultMessage/run:summary)}</run:summary>
                    <run:detail>
                        <run:message>{fn:data($getTimeAsCustomerResponse/run:RuntimeFaultMessage/run:detail/run:message)}</run:message>
                        <run:originalPayload>{fn:data($getTimeAsCustomerResponse/run:RuntimeFaultMessage/run:detail/run:originalPayload)}</run:originalPayload>
                        <run:coreFault>{fn:data($getTimeAsCustomerResponse/run:RuntimeFaultMessage/run:detail/run:coreFault)}</run:coreFault>
                    </run:detail>
                    <run:causedBy>{fn:data($getTimeAsCustomerResponse/run:RuntimeFaultMessage/run:causedBy)}</run:causedBy>
                </run:RuntimeFaultMessage>
            else ()
        }
        {
            if ($getTimeAsCustomerResponse/ns1:applicationId)
            then <ns2:applicationId>{fn:data($getTimeAsCustomerResponse/ns1:applicationId)}</ns2:applicationId>
            else ()
        }
        {
            if ($getTimeAsCustomerResponse/ns1:min)
            then <ns2:min>{fn:data($getTimeAsCustomerResponse/ns1:min)}</ns2:min>
            else ()
        }
        {
            if ($getTimeAsCustomerResponse/ns1:transactionId)
            then <ns2:transactionId>{fn:data($getTimeAsCustomerResponse/ns1:transactionId)}</ns2:transactionId>
            else ()
        }
        {
            if ($getTimeAsCustomerResponse/ns1:transactionDate)
            then <ns2:transactionDate>{fn:data($getTimeAsCustomerResponse/ns1:transactionDate)}</ns2:transactionDate>
            else ()
        }
        {
            if ($getTimeAsCustomerResponse/ns1:ScoreCode)
            then <ns2:ScoreCode>{fn:data($getTimeAsCustomerResponse/ns1:ScoreCode)}</ns2:ScoreCode>
            else ()
        }
    </ns2:getTimeAsCustomerResponse>
};

local:GetTimeAsCustomerResponse($getTimeAsCustomerResponse)
