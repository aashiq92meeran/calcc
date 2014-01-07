//
//  MYViewController.m/Users/bsauniv20/Documents/Manojkumar/Calculator/Calculator/Base.lproj/Main_iPhone.storyboard
//  Calculator
//
//  Created by BSA Univ20 on 06/01/14.
//  Copyright (c) 2014 hispark. All rights reserved.
//

#import "MYViewController.h"

@interface MYViewController ()

@end

@implementation MYViewController

- (void)viewDidLoad
{
    values=[[NSMutableString alloc]init];
    [display setText:values];
    
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)buttonClicked:(id)sender
{
    
    UIButton *bt=(UIButton *)sender;
    
    NSString *buttonLabel=bt.titleLabel.text;
    
    
    //stores numbers into values as string
    values=[NSMutableString stringWithFormat:@"%@%@",values,buttonLabel];
    display.text=values;
    
}

-(IBAction)buttonOperation:(id)op
{
    
    opera=plus;
    
    [display setText:@"+"];
    //if Plus is pressed multiple times
    if(pValue==0)
        pValue=[values integerValue];
    
    else
    {
        cValue=[values integerValue];
        pValue+=cValue;
        NSString *result=[NSString stringWithFormat:@"%i",pValue];
        [display setText:result];
        
    }
    values=[NSMutableString stringWithFormat:@"%s",""];
}
-(IBAction)buttonOperationMinus:(id)op{
    [display setText:@"-"];
    
    opera=minus;
    
    //if Plus is pressed multiple times
    if(pValue==0)
        pValue=[values integerValue];
    
    values=[NSMutableString stringWithFormat:@"%s",""];
}
-(IBAction)buttonOperationMultiply:(id)op
{
    opera=multiply;
    [display setText:@"*"];
    //if Plus is pressed multiple times
    if(pValue==0)
        pValue=[values integerValue];
    values=[NSMutableString stringWithFormat:@"%s",""];
}
-(IBAction)buttonOperationDivide:(id)op
{
    opera=divide;
    
    [display setText:@"/"];
    //if Plus is pressed multiple times
    
    if(pValue==0)
        pValue=[values floatValue];
    
    else
    {
        cValue=[values floatValue];
        pValue/=cValue;
        NSString *result=[NSString stringWithFormat:@"%f",pValue];
        [display setText:result];
        
    }
    values=[NSMutableString stringWithFormat:@"%s",""];
    

   
}
-(IBAction)buttonOperationEqual:(id)op
{
    
    switch (opera) {
        case plus:
        {
            cValue=[values integerValue];
            pValue+=cValue;
            NSString *result=[NSString stringWithFormat:@"%i",pValue];
            [display setText:result];
             pValue=0;
            
            break;
        }
            
        case minus:
        {
            cValue=[values integerValue];
            pValue-=cValue;
            NSString *result=[NSString stringWithFormat:@"%i",pValue];
            [display setText:result];
            pValue=0;
            break;
        }
        
        case multiply:
        
        {
            cValue=[values integerValue];
            pValue*=cValue;
            NSString *result=[NSString stringWithFormat:@"%i",pValue];
            [display setText:result];
            pValue=0;
            break;
        }
        case divide:
        
        {
            cValue=[values floatValue];
            a=pValue/cValue;
            NSString *result=[NSString stringWithFormat:@"%f",a];
            [display setText:result];
            pValue=0;
            break;
            values=[NSMutableString stringWithFormat:@"%s",""];
        }
                    default:
            break;
    }
}
-(IBAction)clearDisplay:(id)sender
{
    pValue=0;
    cValue=0;
    values=[NSMutableString stringWithFormat:@"%s",""];
    [display setText:@""];
}
@end


