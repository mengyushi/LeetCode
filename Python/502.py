def findMaximizedCapital(self, k, W, Profits, Capital):
        h = []
        projects = sorted(zip(Profits, Capital), key=lambda l: l[1])
        i = 0
        for _ in range(k):
            while i < len(projects) and projects[i][1] <= W:
                heapq.heappush(h, -projects[i][0])
                i += 1
            if h: W -= heapq.heappop(h)
        return W
