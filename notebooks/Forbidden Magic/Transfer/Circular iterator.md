```java
static class CircularIterator<T> implements Iterator<T> {
        private final List<T> list;
        private Iterator<T> iterator;

        CircularIterator(List<T> list) {
            this.list = list;
            this.iterator = list.iterator();
        }

        @Override
        public boolean hasNext() {
            return !list.isEmpty();
        }

        @Override
        public T next() {
            if (!iterator.hasNext()) {
                iterator = list.iterator();
            }
            return iterator.next();
        }

        public void skip(int n) {
            while (--n >= 0 && hasNext()) {
                next();
            }
        }

        @Override
        public void remove() {
            iterator.remove();
        }
    }
```

## next()
For `!iterator.hasNext()` this calls `hasNext()` from the Java iterator class. 
To clear up confusion, the override to the `hasNext()` of CircularIterator is called through: `this.hasNext()`  

## skip(int n)
This calls `next()` to advance the iterator `n` times circularly.
Can also be written as a for loop for legibility:
```java
public void skip(int n) {
    for (int i = 0; i < n && hasNext(); i++) {
        next();
    }
}
```