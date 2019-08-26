class TimeMap(object):

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.list = collections.defaultdict(list)
        

    def set(self, key, value, timestamp):
        """
        :type key: str
        :type value: str
        :type timestamp: int
        :rtype: None
        """
        self.list[key].append((timestamp,value))
        

    def get(self, key, timestamp):
        """
        :type key: str
        :type timestamp: int
        :rtype: str
        """
        A = self.list.get(key, None)
        if A == None:
            return ""
        else:
            i = bisect.bisect(A,(timestamp,chr(127)))
            return A[i-1][1] if i else ""

# Your TimeMap object will be instantiated and called as such:
# obj = TimeMap()
# obj.set(key,value,timestamp)
# param_2 = obj.get(key,timestamp)
