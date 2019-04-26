xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace ns3 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns2="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)
declare namespace ns1="http://www.tracfone.com/AccountDataServices";
(:: import schema at "../../DataServices/xsd/AccountDataServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $E911AddressInformationResponseType as element() (:: schema-element(ns1:insertE911AddressInformationResponse) ::) external;

declare function local:InsertE911AddressInformationResponse($E911AddressInformationResponseType as element() (:: schema-element(ns1:insertE911AddressInformationResponse) ::)) as element() (:: schema-element(ns2:insertE911AddressInformationResponse) ::) {
    <ns2:insertE911AddressInformationResponse>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($E911AddressInformationResponseType/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($E911AddressInformationResponseType/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
         <com:result>
                    <com:code>{ fn:data($E911AddressInformationResponseType/com:result/com:code) }</com:code>
                    <com:message>{ fn:data($E911AddressInformationResponseType/com:result/com:message) }</com:message>
                </com:result>
                <com:serverTransactionId>{ fn:data($E911AddressInformationResponseType/com:serverTransactionId) }</com:serverTransactionId>
                {
                    for $RuntimeFaultMessage in $E911AddressInformationResponseType/ns3:RuntimeFaultMessage
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
    </ns2:insertE911AddressInformationResponse>
};

local:InsertE911AddressInformationResponse($E911AddressInformationResponseType)
