#include <iostream>
#define DEBUG //테스트용 flag
using namespace std;

void getInput() {
  /* 값 받는 코드*/
}

void solve() {
  /*문제 푸는 코드*/
}

#ifdef DEBUG
// 테스트용
int main() {
  int t;
  cin >> t;
  while(t--){
    getInput();
    solve();
  }
  return 0;
}
#endif

#ifndef DEBUG
// 제출용
int main() {
  getInput();
  solve();
  return 0;
}
#endif
