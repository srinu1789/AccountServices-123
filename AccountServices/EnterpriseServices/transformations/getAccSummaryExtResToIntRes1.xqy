xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getAccountSummaryResponse1" element="ns3:getAccountSummaryResponse" location="../../DataServices/xsd/AccountDataServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:getAccountSummaryResponse" location="../xsd/AccountServices.xsd" ::)

declare namespace ns2 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns3 = "http://www.tracfone.com/AccountDataServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace ns4 = "http://www.tracfone.com/PhoneCommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/getAccSummaryExtResToIntRes1/";

declare function xf:getAccSummaryExtResToIntRes1($getAccountSummaryResponse1 as element(ns3:getAccountSummaryResponse))
    as element(ns2:getAccountSummaryResponse) {
        <ns2:getAccountSummaryResponse>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($getAccountSummaryResponse1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($getAccountSummaryResponse1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:result>
                <ns0:code>{ data($getAccountSummaryResponse1/ns0:result/ns0:code) }</ns0:code>
                <ns0:message>{ data($getAccountSummaryResponse1/ns0:result/ns0:message) }</ns0:message>
            </ns0:result>
            <ns0:serverTransactionId>{ data($getAccountSummaryResponse1/ns0:serverTransactionId) }</ns0:serverTransactionId>
            {
                for $RuntimeFaultMessage in $getAccountSummaryResponse1/ns1:RuntimeFaultMessage
                return
                    <ns1:RuntimeFaultMessage>{ $RuntimeFaultMessage/@* , $RuntimeFaultMessage/node() }</ns1:RuntimeFaultMessage>
            }
            {
            for $MonthlyPlanCharges in $getAccountSummaryResponse1/ns3:MonthlyPlanCharges
            return
            <ns2:MonthlyPlanCharges>{ data($getAccountSummaryResponse1/ns3:MonthlyPlanCharges) }</ns2:MonthlyPlanCharges>
            }
             {
            for $ESNSummary in $getAccountSummaryResponse1/ns3:ESNSummary
            return
            <ns2:ESNSummary>
                <ns2:New>{ data($getAccountSummaryResponse1/ns3:ESNSummary/ns3:New) }</ns2:New>
                <ns2:Active>{ data($getAccountSummaryResponse1/ns3:ESNSummary/ns3:Active) }</ns2:Active>
                <ns2:Expiring>{ data($getAccountSummaryResponse1/ns3:ESNSummary/ns3:Expiring) }</ns2:Expiring>
                <ns2:Expired>{ data($getAccountSummaryResponse1/ns3:ESNSummary/ns3:Expired) }</ns2:Expired>
            </ns2:ESNSummary>
            }
              {
            for $groupInfo in $getAccountSummaryResponse1/ns3:groupInfo
            return
            <ns2:groupInfo>
              {
            for $firstName in $groupInfo/ns3:firstName
            return
                <ns2:firstName>{ data($firstName) }</ns2:firstName>
                }
                  {
            for $lastName in $groupInfo/ns3:lastName
            return
                <ns2:lastName>{ data($lastName) }</ns2:lastName>
                }
                  {
            for $email in $groupInfo/ns3:email
            return
                <ns2:email>{ data($email) }</ns2:email>
                }
                
            {
            for $groupId in $groupInfo/ns3:groupId
            return
                <ns2:groupId>{ data($groupId) }</ns2:groupId>
                }
                {
                
		            for $groupName in $groupInfo/ns3:groupName
		            return
		                <ns2:groupName>{ data($groupName) }</ns2:groupName>
                }
                    {
            for $planId in $groupInfo/ns3:planId
            return
                <ns2:planId>{ data($planId) }</ns2:planId>
                }
                
                 {
            for $planName in $groupInfo/ns3:planName
            return
                <ns2:planName>{ data($planName) }</ns2:planName>
                }
            {
            for $leaseStatus in $groupInfo/ns3:leaseStatus
            return
                <ns2:leaseStatus>{ data($leaseStatus) }</ns2:leaseStatus>
                }
                 {
            for $totalLines in $groupInfo/ns3:totalLines
            return
                <ns2:totalLines>{ data($totalLines) }</ns2:totalLines>
                }
                 {
            for $availableLines in $groupInfo/ns3:availableLines
            return
                <ns2:availableLines>{ data($availableLines) }</ns2:availableLines>
                }
                  {
            for $activeLines in $groupInfo/ns3:activeLines
            return
                <ns2:activeLines>{ data($activeLines) }</ns2:activeLines>
                }
               {
            for $deviceInfo in $groupInfo/ns3:deviceList
            return
            <ns2:deviceList>
              {
                for $min in $deviceInfo/ns3:min
                 return
                <ns2:min>{ data($min) }</ns2:min>
                }
                  {
                for $esn in $deviceInfo/ns3:esn
                 return
                <ns2:esn>{ data($esn) }</ns2:esn>
                }
                  {
                                  for $isLeased in $deviceInfo/ns3:isLeased
                 return
                <ns2:isLeased>{ data($isLeased) }</ns2:isLeased>
                }
                  {
                for $leaseStatus in $deviceInfo/ns3:leaseStatus
                 return
                <ns2:leaseStatus>{ data($leaseStatus) }</ns2:leaseStatus>
                }
                 {
                for $esnStatus in $deviceInfo/ns3:esnStatus
                 return
                <ns2:esnStatus>{ data($esnStatus) }</ns2:esnStatus>
                }
                {
                for $accountGroupId in $deviceInfo/ns3:accountGroupId
                 return
                <ns2:accountGroupId>{ data($accountGroupId) }</ns2:accountGroupId>
                }
                {
                for $accountGroupName in $deviceInfo/ns3:accountGroupName
                 return
                <ns2:accountGroupName>{ data($accountGroupName) }</ns2:accountGroupName>
                }
                {
                for $accountGroupStatus in $deviceInfo/ns3:accountGroupStatus
                 return
                <ns2:accountGroupStatus>{ data($accountGroupStatus) }</ns2:accountGroupStatus>
                }
                {
                for $accountGroupMemberStatus in $deviceInfo/ns3:accountGroupMemberStatus
                 return
                <ns2:accountGroupMemberStatus>{ data($accountGroupMemberStatus) }</ns2:accountGroupMemberStatus>
                }
                {
                for $brand in $deviceInfo/ns3:brand
                 return
                <ns2:brand>{ data($brand) }</ns2:brand>
                }
                {
                for $applicationRequestNumber in $deviceInfo/ns3:applicationRequestNumber
                 return
                <ns2:applicationRequestNumber>{ data($applicationRequestNumber) }</ns2:applicationRequestNumber>
                }
                {
                for $planId in $deviceInfo/ns3:planId
                 return
                <ns2:planId>{ data($planId) }</ns2:planId>
                }
                {
                for $planName in $deviceInfo/ns3:planName
                 return
                <ns2:planName>{ data($planName) }</ns2:planName>
                }
                 {
                for $totalLines in $deviceInfo/ns3:totalLines
                 return
                <ns2:totalLines>{ data($totalLines) }</ns2:totalLines>
                }
                  {
                for $availableLines in $deviceInfo/ns3:availableLines
                 return
                <ns2:availableLines>{ data($availableLines) }</ns2:availableLines>
                }
                {
                for $webUserObjid in $deviceInfo/ns3:webUserObjid
                 return
                <ns2:webUserObjid>{ data($webUserObjid) }</ns2:webUserObjid>
                }
            </ns2:deviceList>            
               }
            </ns2:groupInfo>
            
            }
        </ns2:getAccountSummaryResponse>
};

declare variable $getAccountSummaryResponse1 as element(ns3:getAccountSummaryResponse) external;

xf:getAccSummaryExtResToIntRes1($getAccountSummaryResponse1)