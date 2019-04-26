xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$checkMyAccountResponse1" element="ns3:checkMyAccountResponse" location="../xsd/AccountManagerDS-BPEL.xsd" ::)
(:: pragma bea:global-element-return element="ns2:getAccountInfoFromEsnResponse" location="../xsd/AccountDataServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountDataServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns3 = "http://www.tracfone.com/OAuthAccountManagerDataService";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/DataServices/transformations/getAccountInfoFromEsnResponse/";

declare function xf:getAccountInfoFromEsnResponse($checkMyAccountResponse1 as element(ns3:checkMyAccountResponse))
    as element(ns2:getAccountInfoFromEsnResponse) {
        <ns2:getAccountInfoFromEsnResponse>
            <ns0:requestToken>{ $checkMyAccountResponse1/ns0:requestToken/@* , $checkMyAccountResponse1/ns0:requestToken/node() }</ns0:requestToken>
            <ns0:result>{ $checkMyAccountResponse1/ns0:result/@* , $checkMyAccountResponse1/ns0:result/node() }</ns0:result>
            <ns0:serverTransactionId>{ data($checkMyAccountResponse1/ns0:serverTransactionId) }</ns0:serverTransactionId>
            {
                for $RuntimeFaultMessage in $checkMyAccountResponse1/ns1:RuntimeFaultMessage
                return
                    <ns1:RuntimeFaultMessage>{ $RuntimeFaultMessage/@* , $RuntimeFaultMessage/node() }</ns1:RuntimeFaultMessage>
            }
            <ns2:accountId>{ data($checkMyAccountResponse1/ns3:accountId) }</ns2:accountId>
            <ns2:contactId>{ data($checkMyAccountResponse1/ns3:contactObjId) }</ns2:contactId>
            <ns2:userToken>{ data($checkMyAccountResponse1/ns3:userToken) }</ns2:userToken>
            <ns2:brand>{ data($checkMyAccountResponse1/ns3:brand) }</ns2:brand>
            <ns2:model>{ data($checkMyAccountResponse1/ns3:model) }</ns2:model>
            <ns2:url>{ data($checkMyAccountResponse1/ns3:url) }</ns2:url>
            <ns2:loginLevel>{ data($checkMyAccountResponse1/ns3:loginLevel) }</ns2:loginLevel>
            <ns2:isEmailValidated>{ data($checkMyAccountResponse1/ns3:isEmailValid) }</ns2:isEmailValidated>
            <ns2:email>{ data($checkMyAccountResponse1/ns3:email) }</ns2:email>
        </ns2:getAccountInfoFromEsnResponse>
};

declare variable $checkMyAccountResponse1 as element(ns3:checkMyAccountResponse) external;

xf:getAccountInfoFromEsnResponse($checkMyAccountResponse1)