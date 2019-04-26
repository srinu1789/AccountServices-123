xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace ns3 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns2="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)
declare namespace ns1="http://www.tracfone.com/SubmitE911AddressCaseOS";
(:: import schema at "../xsd/SubmitE911AddressCaseOS.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $SubmitE911AddressCaseResponseType as element() (:: schema-element(ns1:submitE911AddressCaseResponse) ::) external;

declare function local:SubmitE911AddressCaseResponse($SubmitE911AddressCaseResponseType as element() (:: schema-element(ns1:submitE911AddressCaseResponse) ::)) as element() (:: schema-element(ns2:submitE911AddressCaseResponse) ::) {
    <ns2:submitE911AddressCaseResponse>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($SubmitE911AddressCaseResponseType/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($SubmitE911AddressCaseResponseType/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
         <com:result>
                    <com:code>{ fn:data($SubmitE911AddressCaseResponseType/com:result/com:code) }</com:code>
                    <com:message>{ fn:data($SubmitE911AddressCaseResponseType/com:result/com:message) }</com:message>
                </com:result>
                <com:serverTransactionId>{ fn:data($SubmitE911AddressCaseResponseType/com:serverTransactionId) }</com:serverTransactionId>
                {
                    for $RuntimeFaultMessage in $SubmitE911AddressCaseResponseType/ns3:RuntimeFaultMessage
                    return
                        <ns3:RuntimeFaultMessage>
                            <ns3:code>{ fn:data($RuntimeFaultMessage/ns3:code) }</ns3:code>
                            <ns3:subcode>{ fn:data($RuntimeFaultMessage/ns3:subcode) }</ns3:subcode>
                            <ns3:isRetriable>{ fn:data($RuntimeFaultMessage/ns3:isRetriable) }</ns3:isRetriable>
                            <ns3:summary>{ fn:data($RuntimeFaultMessage/ns3:summary) }</ns3:summary>
                            <ns3:detail>
                                <ns3:message>{ fn:data($RuntimeFaultMessage/ns3:detail/ns3:message) }</ns3:message>
                                <ns3:originalPayload>{fn:data($RuntimeFaultMessage/ns3:detail/ns3:originalPayload)}</ns3:originalPayload>
                                <ns3:coreFault>{fn:data($RuntimeFaultMessage/ns3:detail/ns3:coreFault)}</ns3:coreFault>
                            </ns3:detail>
                            <ns3:causedBy>{fn:data($RuntimeFaultMessage/ns3:causedBy)}</ns3:causedBy>
                        </ns3:RuntimeFaultMessage>
                }
        
        {
            if ($SubmitE911AddressCaseResponseType/ns1:actionItemStatusCode)
            then <ns2:actionItemStatusCode>{fn:data($SubmitE911AddressCaseResponseType/ns1:actionItemStatusCode)}</ns2:actionItemStatusCode>
            else ()
        }
        <ns2:actionItemObjId>{fn:data($SubmitE911AddressCaseResponseType/ns1:actionItemObjId)}</ns2:actionItemObjId>
        <ns2:actionItemId>{fn:data($SubmitE911AddressCaseResponseType/ns1:actionItemId)}</ns2:actionItemId>
        {
            if ($SubmitE911AddressCaseResponseType/ns1:destinationQueue)
            then <ns2:destinationQueue>{fn:data($SubmitE911AddressCaseResponseType/ns1:destinationQueue)}</ns2:destinationQueue>
            else ()
        }
        {
            if ($SubmitE911AddressCaseResponseType/ns1:igTransStatus)
            then <ns2:igTransStatus>{fn:data($SubmitE911AddressCaseResponseType/ns1:igTransStatus)}</ns2:igTransStatus>
            else ()
        }
    </ns2:submitE911AddressCaseResponse>
};

local:SubmitE911AddressCaseResponse($SubmitE911AddressCaseResponseType)
