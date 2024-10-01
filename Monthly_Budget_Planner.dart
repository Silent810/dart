import 'dart:io';

// Creating a class with the name BudgetPlanner according to the given information
class BudgetPlanner {
  double tIncome = 0;
  List<Expense> expenses = [];
  
  // Getting total income input from the user then will go to expenses
  void inputIncome() {
    stdout.write('Enter your total monthly income: ');
    tIncome = double.parse(stdin.readLineSync()!);
    print('');
  }

  // Getting expenses from the user 
  void addExpense() {
    stdout.write('Enter expense name: ');
    String expenseName = stdin.readLineSync()!;
    stdout.write('Enter expense amount for $expenseName: ');
    double amount = double.parse(stdin.readLineSync()!);
    expenses.add(Expense(expenseName, amount)); // Adding expenses in the list with its name 
    print('');
  }

  // Calculating total expenses
  double calculateTotalExpenses() {
    double total = 0;
    for (var expense in expenses) {
      total += expense.amount;
    }
    return total;
  }

  // Remaining balance counting by submission
  double calculateRemainingBalance() {
    return tIncome - calculateTotalExpenses();
  }
  
  void displaySummary() {
    print('\nMonthly Budget Summary'); // Displaying all functions and their value till 2 digits after points
    print('\nTotal Income: \$${tIncome.toStringAsFixed(2)}\n'); // Extra space
    print('Total Expenses: \$${calculateTotalExpenses().toStringAsFixed(2)}\n'); // Extra space
    print('Remaining Balance: \$${calculateRemainingBalance().toStringAsFixed(2)}\n'); // Extra space
    print('Expense Details:');
    for (var expense in expenses) {
      print('${expense.category}: \$${expense.amount.toStringAsFixed(2)}');
    }
  }
}

class Expense {
  String category;
  double amount;
  Expense(this.category, this.amount);
}

void main() {
  BudgetPlanner planner = BudgetPlanner();

  planner.inputIncome();

  while (true) {
    stdout.write('Do you want to add an expense? (yes/no): ');
    String response = stdin.readLineSync()!.toLowerCase();
    if (response != 'yes') break;

    planner.addExpense();
  }

  planner.displaySummary();
}
