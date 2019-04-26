xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://b2b.tracfone.com/MobileAccountServices/v2";
(:: import schema at "../../../xsd/MobileAccountServices_V2.xsd" ::)
declare namespace ns1="http://www.tracfone.com/AccountDataServices";
(:: import schema at "../../../../DataServices/xsd/AccountDataServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare namespace acc = "http://www.tracfone.com/AccountCommonTypes";

declare namespace ser = "http://www.tracfone.com/ServicePlanCommonTypes";

declare variable $getTransactionHistoryResponse as element() (:: schema-element(ns1:getTransactionHistoryResponse) ::) external;
declare variable $getTransactionHistoryRequest as element() (:: schema-element(ns2:getTransactionHistoryRequest) ::) external;

declare function local:DataServices2GetTransactionHistoryResponse($getTransactionHistoryResponse as element() (:: schema-element(ns1:getTransactionHistoryResponse) ::),$getTransactionHistoryRequest as element() (:: schema-element(ns2:getTransactionHistoryRequest) ::)) as element() (:: schema-element(ns2:getTransactionHistoryResponse) ::) {
    <ns2:getTransactionHistoryResponse>
        <com:requestToken>
          <com:clientTransactionId>{fn:data($getTransactionHistoryRequest/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($getTransactionHistoryRequest/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <ns2:totalTransactions>{fn:count($getTransactionHistoryResponse/ns1:transactionList/ns1:transaction)}</ns2:totalTransactions>
        <com:result>
        <com:code>{fn:data($getTransactionHistoryResponse/com:result/com:code)}</com:code>
        <com:message>{fn:data($getTransactionHistoryResponse/com:result/com:message)}</com:message>
        </com:result>
        <ns2:transactionList>
        {
        for $transaction in $getTransactionHistoryResponse/ns1:transactionList/ns1:transaction
        return
            <ns2:transaction>
                <ns2:trasactionInfo>
                    <acc:transactionDate>{ fn:concat(fn:substring(fn:data($transaction/ns1:trasactionInfo/acc:transactionDate), 6, 2),'-',fn:substring(fn:data($transaction/ns1:trasactionInfo/acc:transactionDate), 9, 2),'-',fn:substring(fn:data($transaction/ns1:trasactionInfo/acc:transactionDate),1,4)) }</acc:transactionDate>
                    <acc:transactionType>{fn:data($transaction/ns1:trasactionInfo/acc:transactionType)}</acc:transactionType>
                 
                 
                    <acc:transactionId>{fn:data($transaction/ns1:trasactionInfo/acc:transactionId)}</acc:transactionId>
                   
                </ns2:trasactionInfo>
                
                                {
                    if ($transaction/ns1:servicePlanInfo)
                    then 
                        <ns2:servicePlanInfo>
                        
                         {
						                                if ($transaction/ns1:servicePlanInfo/ser:planId)
						                                then <ser:planId>{fn:data($transaction/ns1:servicePlanInfo/ser:planId)}</ser:planId>
						                                else ()
                            }
                                                        
                        
                         {
						                                if ($transaction/ns1:servicePlanInfo/ser:planId)
						                                then <ser:planId>{fn:data($transaction/ns1:servicePlanInfo/ser:planId)}</ser:planId>
						                                else ()
                            }
                                                        
                        
                         {
			                                if ($transaction/ns1:servicePlanInfo/ser:shortDescription)
			                                then <ser:shortDescription>{fn:data($transaction/ns1:servicePlanInfo/ser:shortDescription)}</ser:shortDescription>
			                                else ()
                            }
                           
                            {
                                if ($transaction/ns1:servicePlanInfo/ser:planDescription)
                                then <ser:planDescription>{fn:data($transaction/ns1:servicePlanInfo/ser:planDescription)}</ser:planDescription>
                                else ()
                            }
                            {
                                if ($transaction/ns1:servicePlanInfo/ser:planDescription2)
                                then <ser:planDescription2>{fn:data($transaction/ns1:servicePlanInfo/ser:planDescription2)}</ser:planDescription2>
                                else ()
                            }
                            {
                                if ($transaction/ns1:servicePlanInfo/ser:planDescription3)
                                then <ser:planDescription3>{fn:data($transaction/ns1:servicePlanInfo/ser:planDescription3)}</ser:planDescription3>
                                else ()
                            }
                            {
                                if ($transaction/ns1:servicePlanInfo/ser:planDescription4)
                                then <ser:planDescription4>{fn:data($transaction/ns1:servicePlanInfo/ser:planDescription4)}</ser:planDescription4>
                                else ()
                            }
                            
                        </ns2:servicePlanInfo>
                    else ()
                }
               
                <ns2:device>
                    <acc:deviceNickName>{fn:data($transaction/ns1:device/acc:deviceNickName)}</acc:deviceNickName>
                    {
                       if (fn:starts-with(fn:data($transaction/ns1:device/acc:min),'T'))
                        then <acc:min></acc:min>
                       else (<acc:min>{fn:data($transaction/ns1:device/acc:min)}</acc:min>)
                    }
                    {
                       if ($transaction/ns1:device/acc:esn)
                        then <acc:esn>{fn:data($transaction/ns1:device/acc:esn)}</acc:esn>
                        else ()
                    }
                </ns2:device>
                {
		                    if ($transaction/ns1:group) then
		                    <ns2:group>
		                        <acc:groupId>{fn:data($transaction/ns1:group/ns1:groupId)}</acc:groupId>
				                <acc:groupName>{fn:data($transaction/ns1:group/ns1:groupName)}</acc:groupName>
				             
		            </ns2:group>
		            else()
            }
            </ns2:transaction>
            }
        </ns2:transactionList>
    </ns2:getTransactionHistoryResponse>
};

local:DataServices2GetTransactionHistoryResponse($getTransactionHistoryResponse,$getTransactionHistoryRequest)
