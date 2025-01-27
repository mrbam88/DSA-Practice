// Longest Substring Without Repeating Characters
function lengthOfLongestSubstring(s) {
    const charIndexMap = new Map();
    let maxLength = 0;
    let start = 0;
    for (let i = 0; i < s.length; i++) {
        if (charIndexMap.has(s[i]) && charIndexMap.get(s[i]) >= start) {
            start = charIndexMap.get(s[i]) + 1;
        }
        charIndexMap.set(s[i], i);
        maxLength = Math.max(maxLength, i - start + 1);
    }
    return maxLength;
}

// Valid Anagram
function isAnagram(s, t) {
    if (s.length !== t.length) return false;
    const count = new Array(26).fill(0);
    for (let i = 0; i < s.length; i++) {
        count[s.charCodeAt(i) - 97]++;
        count[t.charCodeAt(i) - 97]--;
    }
    return count.every(val => val === 0);
}

// Minimum Window Substring
function minWindow(s, t) {
    if (t.length > s.length) return "";
    const tCount = new Map();
    const windowCount = new Map();
    for (const char of t) {
        tCount.set(char, (tCount.get(char) || 0) + 1);
    }
    let have = 0;
    let need = tCount.size;
    let res = [-1, -1];
    let resLen = Infinity;
    let left = 0;
    for (let right = 0; right < s.length; right++) {
        const char = s[right];
        windowCount.set(char, (windowCount.get(char) || 0) + 1);
        if (tCount.has(char) && windowCount.get(char) === tCount.get(char)) {
            have++;
        }
        while (have === need) {
            if (right - left + 1 < resLen) {
                res = [left, right];
                resLen = right - left + 1;
            }
            windowCount.set(s[left], windowCount.get(s[left]) - 1);
            if (tCount.has(s[left]) && windowCount.get(s[left]) < tCount.get(s[left])) {
                have--;
            }
            left++;
        }
    }
    return resLen === Infinity ? "" : s.slice(res[0], res[1] + 1);
}
