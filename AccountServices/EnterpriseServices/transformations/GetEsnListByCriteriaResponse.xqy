xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getEsnListByCriteriaResponse1" element="ns5:getEsnListByCriteriaResponse" location="../../DataServices/xsd/AccountDataServices.xsd" ::)
(:: pragma bea:global-element-return element="ns3:getEsnListByCriteriaResponse" location="../xsd/AccountServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns1 = "http://www.tracfone.com/CommonTypes";
declare namespace ns4 = "http://www.tracfone.com/ServicePlanCommonTypes";
declare namespace ns3 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns0 = "http://www.tracfone.com/PhoneCommonTypes";
declare namespace ns5 = "http://www.tracfone.com/AccountDataServices";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/GetEsnListByCriteriaResponse/";

declare function xf:GetEsnListByCriteriaResponse($getEsnListByCriteriaResponse1 as element(ns5:getEsnListByCriteriaResponse))
    as element(ns3:getEsnListByCriteriaResponse) {
        <ns3:getEsnListByCriteriaResponse>
            <ns1:requestToken>
                <ns1:clientTransactionId>{ data($getEsnListByCriteriaResponse1/ns1:requestToken/ns1:clientTransactionId) }</ns1:clientTransactionId>
                <ns1:clientId>{ data($getEsnListByCriteriaResponse1/ns1:requestToken/ns1:clientId) }</ns1:clientId>
            </ns1:requestToken>
            <ns1:result>
                <ns1:code>{ data($getEsnListByCriteriaResponse1/ns1:result/ns1:code) }</ns1:code>
                <ns1:message>{ data($getEsnListByCriteriaResponse1/ns1:result/ns1:message) }</ns1:message>
            </ns1:result>
            <ns1:serverTransactionId>{ data($getEsnListByCriteriaResponse1/ns1:serverTransactionId) }</ns1:serverTransactionId>
            <ns2:RuntimeFaultMessage>
                <ns2:code>{ data($getEsnListByCriteriaResponse1/ns2:RuntimeFaultMessage/ns2:code) }</ns2:code>
                <ns2:subcode>{ data($getEsnListByCriteriaResponse1/ns2:RuntimeFaultMessage/ns2:subcode) }</ns2:subcode>
                <ns2:isRetriable>{ data($getEsnListByCriteriaResponse1/ns2:RuntimeFaultMessage/ns2:isRetriable) }</ns2:isRetriable>
                <ns2:summary>{ data($getEsnListByCriteriaResponse1/ns2:RuntimeFaultMessage/ns2:summary) }</ns2:summary>
                <ns2:detail>{ $getEsnListByCriteriaResponse1/ns2:RuntimeFaultMessage/ns2:detail/@* , $getEsnListByCriteriaResponse1/ns2:RuntimeFaultMessage/ns2:detail/node() }</ns2:detail>
                <ns2:causedBy>{ $getEsnListByCriteriaResponse1/ns2:RuntimeFaultMessage/ns2:causedBy/@* , $getEsnListByCriteriaResponse1/ns2:RuntimeFaultMessage/ns2:causedBy/node() }</ns2:causedBy>
            </ns2:RuntimeFaultMessage>
            {
                for $accountDevice in $getEsnListByCriteriaResponse1/ns5:accountDevice
                return
                    <ns3:accountDevice>
                        <ns3:esn>{ data($accountDevice/ns5:esn) }</ns3:esn>
                        <ns3:min>{ data($accountDevice/ns5:min) }</ns3:min>
                        <ns3:nickname>{ data($accountDevice/ns5:nickname) }</ns3:nickname>
                        <ns3:esnStatus>{ data($accountDevice/ns5:esnStatus) }</ns3:esnStatus>
                        <ns3:otaStatus>{ data($accountDevice/ns5:otaStatus) }</ns3:otaStatus>
                        <ns3:buyerId>{ data($accountDevice/ns5:buyerId) }</ns3:buyerId>
                        <ns3:buyerType>{ data($accountDevice/ns5:buyerType) }</ns3:buyerType>
                        <ns3:orgName>{ data($accountDevice/ns5:orgName) }</ns3:orgName>
                        <ns3:planName>{ data($accountDevice/ns5:planName) }</ns3:planName>
                        <ns3:planDescription>{ data($accountDevice/ns5:planDescription) }</ns3:planDescription>
                        <ns3:esnPartNumber>{ data($accountDevice/ns5:esnPartNumber) }</ns3:esnPartNumber>
                    </ns3:accountDevice>
            }
        </ns3:getEsnListByCriteriaResponse>
};

declare variable $getEsnListByCriteriaResponse1 as element(ns5:getEsnListByCriteriaResponse) external;

xf:GetEsnListByCriteriaResponse($getEsnListByCriteriaResponse1)