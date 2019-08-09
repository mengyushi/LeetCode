/**
 * Definition for singly-linked list.
 * class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
public class Solution {
    public ListNode detectCycle(ListNode head) {
        ArrayList checked = new ArrayList<ListNode>();
        ListNode pointer = head;
        while (pointer!= null){
            if (checked.contains(pointer)){
                return pointer;
            }else{
                checked.add(pointer);
            } 
            pointer = pointer.next;
        }
        return null;
    }
}
