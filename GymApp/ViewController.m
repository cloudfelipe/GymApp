//
//  ViewController.m
//  GymApp
//
//  Created by Felipe Correa on 18/05/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import "ViewController.h"

#import "MAFormViewController.h"
#import "MAFormField.h"

#import "AppDelegate.h"
#import "User.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signinBtn:(id)sender {
    
    // Personal info
    
    MAFormField *idNumber = [MAFormField fieldWithKey:@"idNumber" type:MATextFieldTypeNumber initialValue:nil placeholder:@"Número identificación" required:YES];
    
    MAFormField *name = [MAFormField fieldWithKey:@"name" type:MATextFieldTypeName initialValue:nil placeholder:@"Nombre completo" required:YES];
    MAFormField *lastname = [MAFormField fieldWithKey:@"lastname" type:MATextFieldTypeName initialValue:nil placeholder:@"Apellidos" required:YES];
    
    MAFormField *phone = [MAFormField fieldWithKey:@"phone" type:MATextFieldTypePhone initialValue:nil placeholder:@"Número celular (opcional)" required:NO];
    
    MAFormField *age = [MAFormField fieldWithKey:@"age" type:MATextFieldTypeNumber initialValue:nil placeholder:@"Edad" required:YES];
    
    MAFormField *date = [MAFormField fieldWithKey:@"birthday" type:MATextFieldTypeDate initialValue:nil placeholder:@"Fecha nacimiento (YYYY-MM-DD)" required:YES];
    
    MAFormField *street = [MAFormField fieldWithKey:@"street" type:MATextFieldTypeAddress initialValue:nil placeholder:@"Dirrección domicilo (opcional)" required:NO];
    
    MAFormField *occupation = [MAFormField fieldWithKey:@"occupation" type:MATextFieldTypeName initialValue:@"Estudiante" placeholder:@"Ocupación (opcional)" required:NO];
    

    MAFormField *eps = [MAFormField fieldWithKey:@"eps" type:MATextFieldTypeName initialValue:nil placeholder:@"EPS" required:YES];
    
    
    //Account
    
    MAFormField *idSignin = [MAFormField fieldWithKey:@"idSignin" type:MATextFieldTypeNumber initialValue:nil placeholder:@"Código registro" required:YES];
    
    MAFormField *email = [MAFormField fieldWithKey:@"email" type:MATextFieldTypeEmail initialValue:nil placeholder:@"Email" required:YES];
    
    MAFormField *pass = [MAFormField fieldWithKey:@"password" type:MATextFieldTypePassword initialValue:nil placeholder:@"Contraseña" required:YES];
    
    
    // separate the cells into sections
    NSArray *firstSection = @[idSignin,email, pass];
    NSArray *secondSection = @[idNumber, name, lastname, phone, age, date, street, occupation, eps];
    
    NSArray *cellConfig = @[firstSection, secondSection];
    
    // create the form, wrap it in a navigation controller, and present it modally
    MAFormViewController *formVC = [[MAFormViewController alloc] initWithCellConfigurations:cellConfig actionText:@"Save" animatePlaceholders:YES handler:^(NSDictionary *resultDictionary) {
        // now that we're done, dismiss the form
        [self dismissViewControllerAnimated:YES completion:nil];
        
        // if we don't have a result dictionary, the user cancelled, rather than submitted the form
        if (!resultDictionary) {
            return;
        }
        
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        
        User* anUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
        anUser.name = resultDictionary[@"name"];
        anUser.lastsname = resultDictionary[@"lastname"];
        anUser.idNumber = [NSNumber numberWithInteger:[resultDictionary[@"idNumber"]integerValue]];
        anUser.age = [NSNumber numberWithInteger:[resultDictionary[@"age"]integerValue]];
        anUser.phone = [NSNumber numberWithInteger:[resultDictionary[@"phone"]integerValue]];
        anUser.occupation = resultDictionary[@"occupation"];
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        anUser.birthday = [dateFormat dateFromString: resultDictionary[@"birthday"]];
        
        anUser.email = resultDictionary[@"email"];
        anUser.address = resultDictionary[@"street"];
        anUser.eps = resultDictionary[@"eps"];
        anUser.password = resultDictionary[@"password"];
        
        NSError *error;
        if (![context save:&error]) {
            NSLog(@"Nooo, error al grabar: %@", [error localizedDescription]);
        }else{
            // do whatever you want with the results - you can access specific values from the dictionary using
            // the key you provided when you created the form
            [[[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"Thanks for registering %@!", resultDictionary[@"name"]] delegate:nil cancelButtonTitle:@"Yay!" otherButtonTitles:nil] show];
            NSLog(@"%@", [resultDictionary description]);
        }
        
        
    }];
    
    [formVC setTitleForHeaderInSectionBlock:^NSString *(NSInteger section) {
        
        switch (section) {
            case 0:
                return @"Información de la cuenta";
                break;
            case 1:
                return @"Información personal";
                break;
            default:
                return nil;
                break;
        }
    }];
    
    UINavigationController *formNC = [[UINavigationController alloc] initWithRootViewController:formVC];
    [self presentViewController:formNC animated:YES completion:nil];
    
}
@end
