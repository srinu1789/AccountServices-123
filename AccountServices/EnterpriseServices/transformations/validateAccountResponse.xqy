xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$validateAccountResponse1" element="ns3:validateAccountResponse" location="../xsd/AuthenticationBPEL.xsd" ::)
(:: pragma bea:global-element-return element="ns2:validateAccountResponse" location="../xsd/AccountServices.xsd" ::)

declare namespace ns2 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns3 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/validateAccountResponse/";

declare function xf:validateAccountResponse($validateAccountResponse1 as element(ns3:validateAccountResponse))
    as element(ns2:validateAccountResponse) {
        <ns2:validateAccountResponse>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($validateAccountResponse1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($validateAccountResponse1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:result>
                <ns0:code>{ data($validateAccountResponse1/ns0:result/ns0:code) }</ns0:code>
                <ns0:message>{ data($validateAccountResponse1/ns0:result/ns0:message) }</ns0:message>
            </ns0:result>
            <ns0:serverTransactionId>{ data($validateAccountResponse1/ns0:serverTransactionId) }</ns0:serverTransactionId>
            {
                for $RuntimeFaultMessage in $validateAccountResponse1/ns1:RuntimeFaultMessage
                return
                    <ns1:RuntimeFaultMessage>{ $RuntimeFaultMessage/@* , $RuntimeFaultMessage/node() }</ns1:RuntimeFaultMessage>
            }
            <ns2:isValid>{ data($validateAccountResponse1/ns3:isValid) }</ns2:isValid>
            {
                for $accountWebUserId in $validateAccountResponse1/ns3:accountWebUserId
                return
                    <ns2:accountWebUserId>{ data($accountWebUserId) }</ns2:accountWebUserId>
            }
            {
                for $accountContactObjId in $validateAccountResponse1/ns3:accountContactObjId
                return
                    <ns2:accountContactObjId>{ data($accountContactObjId) }</ns2:accountContactObjId>
            }
        </ns2:validateAccountResponse>
};

declare variable $validateAccountResponse1 as element(ns3:validateAccountResponse) external;

xf:validateAccountResponse($validateAccountResponse1)