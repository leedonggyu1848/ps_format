#include <bits/stdc++.h>

using namespace std;

#define FOR(N) for(int i=0; i<(N); ++i)
#define FOR2(N, M) for (int i=0; i<(N); ++i) for (int j=0; j<(M); ++j)
#define INF 987654321

typedef vector<int> vi;
typedef pair<int, int> pii;

  /** 값 받는 코드입니다.
   * 받는 값은 전역변수로 설정해야합니다.
   */
void getInput() {
}

/**
 * 문제를 푸는 코드입니다.
 * 값을 출력하는 것까지 포함합니다.
 */
void solve() {
}

#ifdef BOJ
// 제출용
int main() {
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);
  cout.tie(NULL);
  getInput();
  solve();
  return 0;
}
#endif

#ifndef BOJ
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
