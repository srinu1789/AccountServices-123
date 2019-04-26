xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$authenticateSecurityPinResponseMB1" element="ns3:authenticateSecurityPinResponseMB" location="../../DataServices/xsd/AccountDataServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:validateAccountResponseMB" location="../xsd/AccountServices.xsd" ::)

declare namespace ns2 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns3 = "http://www.tracfone.com/AccountDataServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/validateAccountMBResponse/";

declare function xf:validateAccountMBResponse($authenticateSecurityPinResponseMB1 as element(ns3:authenticateSecurityPinResponseMB))
    as element(ns2:validateAccountResponseMB) {
        <ns2:validateAccountResponseMB>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($authenticateSecurityPinResponseMB1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($authenticateSecurityPinResponseMB1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:result>
                <ns0:code>{ data($authenticateSecurityPinResponseMB1/ns0:result/ns0:code) }</ns0:code>
                <ns0:message>{ data($authenticateSecurityPinResponseMB1/ns0:result/ns0:message) }</ns0:message>
            </ns0:result>
            <ns0:serverTransactionId>{ data($authenticateSecurityPinResponseMB1/ns0:serverTransactionId) }</ns0:serverTransactionId>
            {
                for $RuntimeFaultMessage in $authenticateSecurityPinResponseMB1/ns1:RuntimeFaultMessage
                return
                    <ns1:RuntimeFaultMessage>{ $RuntimeFaultMessage/@* , $RuntimeFaultMessage/node() }</ns1:RuntimeFaultMessage>
            }
            <ns2:isValid>{ data($authenticateSecurityPinResponseMB1/ns3:status) }</ns2:isValid>
            <ns2:accountWebUserId>{ data($authenticateSecurityPinResponseMB1/ns3:webObjId) }</ns2:accountWebUserId>
            <ns2:accountContactObjId>{ data($authenticateSecurityPinResponseMB1/ns3:contactObjId) }</ns2:accountContactObjId>
        </ns2:validateAccountResponseMB>
};

declare variable $authenticateSecurityPinResponseMB1 as element(ns3:authenticateSecurityPinResponseMB) external;

xf:validateAccountMBResponse($authenticateSecurityPinResponseMB1)