// Multiply every other digit by 2, starting with the number’s second-to-last digit, and then add those products' digits together.

// Add the sum to the sum of the digits that weren’t multiplied by 2.

// If the total’s last digit is 0 (or, put more formally, if the total modulo 10 is congruent to 0), the number is valid!

#include <cs50.h>
#include <math.h>
#include <stdio.h>

long long GetPositiveLong(void)
{
  long long n;
  do
  {
    printf("Card number pls:");
    n = GetLongLong();
  }
  while (n < 0);
  return n;
}

int LengthOfNumber (long long n)
{
    if (n < 10) return 1;
    if (n < 100) return 2;
    if (n < 1000) return 3;
    if (n < 10000) return 4;
    if (n < 100000) return 5;
    if (n < 1000000) return 6;
    if (n < 10000000) return 7;
    if (n < 100000000) return 8;
    if (n < 1000000000) return 9;
    if (n < 10000000000) return 10;
    if (n < 100000000000) return 11;
    if (n < 1000000000000) return 12;
    if (n < 10000000000000) return 13;
    if (n < 100000000000000) return 14;
    if (n < 1000000000000000) return 15;
    if (n < 10000000000000000) return 16;
    return 17;
}

int GetFirstDigits(int n, long long num)
{
  long long log10 = ( log(num)/log(10) ) + 1;
  long long divisor = pow(10, log10 - n);
  return num / divisor;
}



bool CheckLuhnValid(long long ccn, int length)
{
  int current_digit;
  for(int i = 1; i <= length; i++)
  {
      current_digit = temp_number % 10;
      if (temp_number == 2)
      {
        temp_number
      }
      printf("%i\n", current_digit);
  }
  return 1;
}

void PrintCardType(int n)
{
  if (n == 0) printf("INVALID\n");
  if (n == 1) printf("VISA\n") ;
  if (n == 2) printf("MASTERCARD\n") ;
  if (n == 3) printf("AMEX\n") ;
}

int main(void)
{
  long long cardNumber = GetPositiveLong();
  int cardLength = LengthOfNumber(cardNumber);
  printf("%i digits long\n", cardLength);

  int cardType;
  int firstDigit = GetFirstDigits(1, cardNumber);
  int firstDigits = GetFirstDigits(2, cardNumber);
  bool luhnValid = CheckLuhnValid(cardNumber, cardLength);
  printf("luhn valid: %s\n", luhnValid ? "true" : "false");

  if ((firstDigit == 4) && (cardLength == 13 || cardLength == 16) && luhnValid) // 13,16 long; check for visa 4
  {
    cardType = 1;
  }
  else if ((firstDigits == 51 || firstDigits == 52 || firstDigits == 53 || firstDigits == 54 || firstDigits == 55) && (cardLength == 16) && luhnValid) // 16 long; else if // check for mastercord  51.52/53/54/55
  {
    cardType = 2;
  }
  else if ((firstDigits == 34 || firstDigits == 37) && (cardLength == 15) && luhnValid)  // 15 long; else if // check for amex 34/37
  {
    cardType = 3;
  }
  else
  {
    cardType = 0;
  }

  PrintCardType(cardType);
}
