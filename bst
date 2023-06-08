#include <stdio.h>
#include <stdlib.h>
struct BSTnode{
struct BSTnode*left;
int data;
struct BSTnode*right;
};
struct BSTnode *root=NULL;
struct BSTnode *create();
void insert(struct BSTnode*,struct BSTnode*);
struct BSTnode *search(struct BSTnode*,int);
void inorder(struct BSTnode*);
struct BSTnode*create(){
struct BSTnode *temp;
temp = (struct BSTnode*)malloc(sizeof(struct BSTnode));
printf("enter data");
scanf("%d",&temp->data);
temp->left = temp->right = NULL;
return temp;
}
void insert(struct BSTnode * root, struct BSTnode * temp)
{
if(temp->data<root->data){
if(root->left!=NULL){
insert(root->left,temp);
}
else{
root->left =temp;
}
}
if(temp->data>=root->data){
if(root->right!=NULL){
insert(root->right,temp);
}
else{
root->right= temp;
}
}
}
void inorder(struct BSTnode*root){
if(root!=NULL){
inorder(root->left);
printf("%d\t",root->data);
inorder(root->right);
}
}
void preorder(struct BSTnode * root)
{
if(root!=NULL){
printf("%d\t",root->data);
preorder(root->left);
preorder(root->right);
}
}
void postorder (struct BSTnode * root)
{
if(root != NULL)
{
postorder(root->left);
postorder(root->right);
printf("%d\t",root->data);
}
}
struct BSTnode *search(struct BSTnode*root,int key){
if(root==NULL){
return NULL;
}
if(key == root->data){
return root;
}
else if(key<root->data){
return search(root->left,key);
}
else{
return search(root->right,key);
}
}
int main()
{
int choice;
char ch;
int key;
struct BSTnode * temp;
do{
printf("1.create\t2.search\t3.recursive traversal\n");
printf("enter your choice");
scanf("%d",&choice);
switch(choice){
case 1:
do{
temp = create();
if(root==NULL){
root = temp;
}
else{
insert(root,temp);
printf("do you want to insert new node? y or n");
getchar();
scanf("%c",&ch);
}
}while(ch=='y');
break;
case 2:
printf("enter key");
scanf("%d",&key);
temp = search(root,key);
if(temp==NULL){
printf("not found");
}
else{
printf("found");
break;
}
case 3:
printf("Inorder ");
inorder(root);
printf("preorder ");
preorder(root);
printf("postorder ");
postorder(root);
break;
case 4:
break;
default:
printf("invalid choice");
break;
}
}while(choice!=4);
return 0;
}
