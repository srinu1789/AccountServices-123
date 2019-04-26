xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$createAccountResponse1" element="ns2:createAccountResponse" location="../xsd/AccountCreation_BPEL.xsd" ::)
(:: pragma bea:global-element-return element="ns2:createAccountResponse" location="../xsd/AccountServices.xsd" ::)

declare namespace ns2 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/AccountCreationResponse/";

declare function xf:AccountCreationResponse($createAccountResponse1 as element(ns2:createAccountResponse))
    as element(ns2:createAccountResponse) {
        <ns2:createAccountResponse>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($createAccountResponse1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($createAccountResponse1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:result>
                <ns0:code>{ data($createAccountResponse1/ns0:result/ns0:code) }</ns0:code>
                <ns0:message>{ data($createAccountResponse1/ns0:result/ns0:message) }</ns0:message>
            </ns0:result>
            {
                for $RuntimeFaultMessage in $createAccountResponse1/ns1:RuntimeFaultMessage
                return
                    <ns1:RuntimeFaultMessage>{ $RuntimeFaultMessage/@* , $RuntimeFaultMessage/node() }</ns1:RuntimeFaultMessage>
            }
            <ns2:webUserObjid>{ data($createAccountResponse1/ns2:webUserObjid) }</ns2:webUserObjid>
        </ns2:createAccountResponse>
};

declare variable $createAccountResponse1 as element(ns2:createAccountResponse) external;

xf:AccountCreationResponse($createAccountResponse1)