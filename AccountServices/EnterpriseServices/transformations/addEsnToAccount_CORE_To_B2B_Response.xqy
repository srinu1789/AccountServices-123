xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$addEsnToAccountResponse1" element="ns3:addEsnToAccountResponse" location="../../DataServices/xsd/AccountDataServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:addEsnToAccountResponse" location="../xsd/AccountServices.xsd" ::)

declare namespace ns2 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns3 = "http://www.tracfone.com/AccountDataServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/addEsnToAccount_CORE_To_B2B_Response/";

declare function xf:addEsnToAccount_CORE_To_B2B_Response($addEsnToAccountResponse1 as element(ns3:addEsnToAccountResponse))
    as element(ns2:addEsnToAccountResponse) {
        <ns2:addEsnToAccountResponse>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($addEsnToAccountResponse1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($addEsnToAccountResponse1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:result>
                <ns0:code>{ data($addEsnToAccountResponse1/ns0:result/ns0:code) }</ns0:code>
                <ns0:message>{ data($addEsnToAccountResponse1/ns0:result/ns0:message) }</ns0:message>
            </ns0:result>
            <ns0:serverTransactionId>{ data($addEsnToAccountResponse1/ns0:serverTransactionId) }</ns0:serverTransactionId>
            {
                for $RuntimeFaultMessage in $addEsnToAccountResponse1/ns1:RuntimeFaultMessage
                return
                    <ns1:RuntimeFaultMessage>{ $RuntimeFaultMessage/@* , $RuntimeFaultMessage/node() }</ns1:RuntimeFaultMessage>
            }
        </ns2:addEsnToAccountResponse>
};

declare variable $addEsnToAccountResponse1 as element(ns3:addEsnToAccountResponse) external;

xf:addEsnToAccount_CORE_To_B2B_Response($addEsnToAccountResponse1)