xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace ns3 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns2="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)
declare namespace ns1="http://www.tracfone.com/AccountDataServices";
(:: import schema at "../../DataServices/xsd/AccountDataServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $UpdateE911AddressInformationResponseType as element() (:: schema-element(ns1:updateE911AddressInformationResponse) ::) external;

declare function local:UpdateE911AddressInformationResponse($UpdateE911AddressInformationResponseType as element() (:: schema-element(ns1:updateE911AddressInformationResponse) ::)) as element() (:: schema-element(ns2:updateE911AddressInformationResponse) ::) {
    <ns2:updateE911AddressInformationResponse>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($UpdateE911AddressInformationResponseType/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($UpdateE911AddressInformationResponseType/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        
         <com:result>
                    <com:code>{ fn:data($UpdateE911AddressInformationResponseType/com:result/com:code) }</com:code>
                    <com:message>{ fn:data($UpdateE911AddressInformationResponseType/com:result/com:message) }</com:message>
                </com:result>
                <com:serverTransactionId>{ fn:data($UpdateE911AddressInformationResponseType/com:serverTransactionId) }</com:serverTransactionId>
                {
                    for $RuntimeFaultMessage in $UpdateE911AddressInformationResponseType/ns3:RuntimeFaultMessage
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
        
    </ns2:updateE911AddressInformationResponse>
};

local:UpdateE911AddressInformationResponse($UpdateE911AddressInformationResponseType)
