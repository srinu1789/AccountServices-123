xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getTransactionHistoryResponse1" element="acccore:getTransactionHistoryResponse" location="../../../CoreServices/xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:global-element-return element="acc:getPaymentHistoryResponse" location="../../xsd/MobileAccountServices.xsd" ::)

declare namespace run = "http://www.tracfone.com/RuntimeFault";
declare namespace acct = "http://www.tracfone.com/AccountCommonTypes";
declare namespace acccore = "http://www.tracfone.com/AccountCoreServices";
declare namespace acc = "http://b2b.tracfone.com/MobileAccountServices";
declare namespace com = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/Mobile/CoreServicesToGetPaymentHistoryResponse/";

declare function xf:CoreServicesToGetPaymentHistoryResponse($getTransactionHistoryResponse1 as element(acccore:getTransactionHistoryResponse),$ESN as xs:string)
    as element(acc:getPaymentHistoryResponse) {
      <acc:getPaymentHistoryResponse>
            <com:result>
                <com:code>{ data($getTransactionHistoryResponse1/com:result/com:code) }</com:code>
                <com:message>{ data($getTransactionHistoryResponse1/com:result/com:message) }</com:message>
            </com:result>
            {
                for $RuntimeFaultMessage in $getTransactionHistoryResponse1/run:RuntimeFaultMessage
                return
                    <run:RuntimeFaultMessage>{ $RuntimeFaultMessage/@* , $RuntimeFaultMessage/node() }</run:RuntimeFaultMessage>
            }
            {
            for $totalTransactions in $getTransactionHistoryResponse1/acccore:totalTransactions
            return
            <acc:totalTransactions>{ $totalTransactions }</acc:totalTransactions>
            }
            {
                let $transactionList := $getTransactionHistoryResponse1/acccore:transactionList
                return
                    <acc:transactionList>
                        {
                        if(fn:string-length($ESN) > 0 ) then  
                        
                            for $transaction in $transactionList/acccore:transaction[acccore:device/acct:esn=$ESN]
                            return
                                <acc:transaction>
                                    {
                                        let $trasactionInfo := $transaction/acccore:trasactionInfo
                                        return
                                            <acc:trasactionInfo>
                                                <acct:transactionDate>{ fn:concat(fn:substring(data($trasactionInfo/acct:transactionDate), 6, 2),'-',fn:substring(data($trasactionInfo/acct:transactionDate), 9, 2),'-',fn:substring(data($trasactionInfo/acct:transactionDate),1,4)) }</acct:transactionDate>
                                                <acct:transactionType>{ data($trasactionInfo/acct:transactionType) }</acct:transactionType>
                                                <acct:transactionTotal>{ data($trasactionInfo/acct:transactionTotal) }</acct:transactionTotal>
                                                <acct:discountTotal>{ data($trasactionInfo/acct:discountTotal) }</acct:discountTotal>
                                                <acct:transactionId>{ data($trasactionInfo/acct:transactionId) }</acct:transactionId>
                                                <acct:transactionStatus>{ data($trasactionInfo/acct:transactionStatus) }</acct:transactionStatus>
                                                <acct:transactionTotalWithoutDiscountAndTax>{ data($trasactionInfo/acct:transactionTotalWithoutDiscountAndTax) }</acct:transactionTotalWithoutDiscountAndTax>
                                                <acct:transactionChannel>{ data($trasactionInfo/acct:transactionChannel) }</acct:transactionChannel>
                                            </acc:trasactionInfo>
                                    }
                                    {									
										
                                        let $taxInfo := $transaction/acccore:taxInfo
                                        return
                                            <acc:taxInfo>                                                
                                                <acct:e911TaxAmount>{ data($taxInfo/acct:e911TaxAmount) }</acct:e911TaxAmount>
                                                <acct:rcrfTaxAmount>{ data($taxInfo/acct:rcrfTaxAmount) }</acct:rcrfTaxAmount>
                                                <acct:combsTaxAmount>{ data($taxInfo/acct:combsTaxAmount) }</acct:combsTaxAmount>
                                                <acct:usfTaxAmount>{ data($taxInfo/acct:usfTaxAmount) }</acct:usfTaxAmount>
                                                <acct:totalTaxAmount>{ data($taxInfo/acct:totalTaxAmount) }</acct:totalTaxAmount>
                                                <acct:totalAmountWithTaxes>{ data($taxInfo/acct:totalAmountWithTaxes) }</acct:totalAmountWithTaxes>
                                            </acc:taxInfo>
                                    }
                                    {
                                        let $paymentSource := $transaction/acccore:paymentSource
                                        return
                                            <acc:paymentSource>
                                                <acct:paymentSourceNickname>{ data($paymentSource/acct:paymentSourceNickname) }</acct:paymentSourceNickname>
                                                <acct:paymentSourceType>{ data($paymentSource/acct:paymentSourceType) }</acct:paymentSourceType>
                                                <acct:paymentSourceNumberMask>{ data($paymentSource/acct:paymentSourceNumberMask) }</acct:paymentSourceNumberMask>
                                            </acc:paymentSource>
                                    }
                                    {
                                        let $device := $transaction/acccore:device
                                        return
                                            <acc:device>
                                                <acct:deviceNickName>{ data($device/acct:deviceNickName) }</acct:deviceNickName>
                                                <acct:min>{ data($device/acct:min) }</acct:min>
                                            </acc:device>
                                    }
                                    {
                                         let $group := $transaction/acccore:group
				                                            return
				                                                <acccore:group>
				                                                    <acccore:groupName>{ data($group/acccore:groupName) }</acccore:groupName>
				                                                   
				                                                </acccore:group>
                                    }
                                    
                                </acc:transaction>
                                else(
                                
                            for $transaction in $transactionList/acccore:transaction
                            return
                                
                                <acc:transaction>
                                    {
                                        let $trasactionInfo := $transaction/acccore:trasactionInfo
                                        return
                                            <acc:trasactionInfo>
                                                <acct:transactionDate>{ fn:concat(fn:substring(data($trasactionInfo/acct:transactionDate), 6, 2),'-',fn:substring(data($trasactionInfo/acct:transactionDate), 9, 2),'-',fn:substring(data($trasactionInfo/acct:transactionDate),1,4)) }</acct:transactionDate>
                                                <acct:transactionType>{ data($trasactionInfo/acct:transactionType) }</acct:transactionType>
                                                <acct:transactionTotal>{ data($trasactionInfo/acct:transactionTotal) }</acct:transactionTotal>
                                                <acct:discountTotal>{ data($trasactionInfo/acct:discountTotal) }</acct:discountTotal>
                                                <acct:transactionId>{ data($trasactionInfo/acct:transactionId) }</acct:transactionId>
                                                <acct:transactionStatus>{ data($trasactionInfo/acct:transactionStatus) }</acct:transactionStatus>
                                                <acct:transactionTotalWithoutDiscountAndTax>{ data($trasactionInfo/acct:transactionTotalWithoutDiscountAndTax) }</acct:transactionTotalWithoutDiscountAndTax>
                                                <acct:transactionChannel>{ data($trasactionInfo/acct:transactionChannel) }</acct:transactionChannel>
                                            </acc:trasactionInfo>
                                    }
                                    {									
										
                                        let $taxInfo := $transaction/acccore:taxInfo
                                        return
                                            <acc:taxInfo>                                                
                                                <acct:e911TaxAmount>{ data($taxInfo/acct:e911TaxAmount) }</acct:e911TaxAmount>
                                                <acct:rcrfTaxAmount>{ data($taxInfo/acct:rcrfTaxAmount) }</acct:rcrfTaxAmount>
                                                <acct:combsTaxAmount>{ data($taxInfo/acct:combsTaxAmount) }</acct:combsTaxAmount>
                                                <acct:usfTaxAmount>{ data($taxInfo/acct:usfTaxAmount) }</acct:usfTaxAmount>
                                                <acct:totalTaxAmount>{ data($taxInfo/acct:totalTaxAmount) }</acct:totalTaxAmount>
                                                <acct:totalAmountWithTaxes>{ data($taxInfo/acct:totalAmountWithTaxes) }</acct:totalAmountWithTaxes>
                                            </acc:taxInfo>
                                    }
                                    {
                                        let $paymentSource := $transaction/acccore:paymentSource
                                        return
                                            <acc:paymentSource>
                                                <acct:paymentSourceNickname>{ data($paymentSource/acct:paymentSourceNickname) }</acct:paymentSourceNickname>
                                                <acct:paymentSourceType>{ data($paymentSource/acct:paymentSourceType) }</acct:paymentSourceType>
                                                <acct:paymentSourceNumberMask>{ data($paymentSource/acct:paymentSourceNumberMask) }</acct:paymentSourceNumberMask>
                                            </acc:paymentSource>
                                    }
                                    {
                                        let $device := $transaction/acccore:device
                                        return
                                            <acc:device>
                                                <acct:deviceNickName>{ data($device/acct:deviceNickName) }</acct:deviceNickName>
                                                <acct:min>{ data($device/acct:min) }</acct:min>
                                            </acc:device>
                                    }
                                   
                                    {
                                         let $group := $transaction/acccore:group
				                                            return
				                                                <acccore:group>
				                                                    <acccore:groupName>{ data($group/acccore:groupName) }</acccore:groupName>
				                                                   
				                                                </acccore:group>
                                    }
                                </acc:transaction>
                     
                                
                                )
                        } 
                    </acc:transactionList>
            }
        </acc:getPaymentHistoryResponse>
};

declare variable $getTransactionHistoryResponse1 as element(acccore:getTransactionHistoryResponse) external;
declare variable $ESN as xs:string external;

xf:CoreServicesToGetPaymentHistoryResponse($getTransactionHistoryResponse1,$ESN)