import { v4 as uuidv4 } from "uuid";
import Confetti from "react-confetti";
import { useCallback, useState } from "react";
import { DragDropContext } from "@hello-pangea/dnd";

import "./App.css";
import KanbanColumn from "./kanban/column";

const updateItems = (sourceItem, source, destination, items) => {
  if (source.status === destination.status) {
    // moving deal inside the same column
    const column = items[source.status];
    column.splice(source.index, 1);
    column.splice(destination.index ?? column.length + 1, 0, sourceItem);
    return {
      ...items,
      [destination.status]: column,
    };
  } else {
    // moving deal across columns
    const sourceColumn = items[source.status];
    const destinationColumn = items[destination.status];
    sourceColumn.splice(source.index, 1);
    destinationColumn.splice(
      destination.index ?? destinationColumn.length + 1,
      0,
      sourceItem
    );
    return {
      ...items,
      [source.status]: sourceColumn,
      [destination.status]: destinationColumn,
    };
  }
};

function App() {
  const [task, setTask] = useState("");
  const [showConfetti, setShowConfetti] = useState(false);
  const [items, setItems] = useState({ Todo: [], Doing: [], Done: [] });

  const handleChange = useCallback((event) => {
    setTask(event.target.value);
  }, []);

  const handleSubmit = useCallback(
    (event) => {
      event.preventDefault();
      if (task.trim().length > 0) {
        setItems((state) => {
          const newObj = { ...state };
          newObj.Todo = [{ task, id: uuidv4() }, ...newObj.Todo];
          return newObj;
        });
        setTask("");
      }
    },
    [task]
  );

  const onDragEnd = useCallback(
    (result) => {
      const { destination, source } = result;

      if (!destination) {
        return;
      }

      if (
        destination.droppableId === source.droppableId &&
        destination.index === source.index
      ) {
        return;
      }

      const sourceStatus = source.droppableId;
      const destinationStatus = destination.droppableId;
      const sourceItem = items[sourceStatus][source.index];

      setItems(
        updateItems(
          sourceItem,
          { status: sourceStatus, index: source.index },
          { status: destinationStatus, index: destination.index },
          items
        )
      );

      const isDone = destination.droppableId === "Done";
      setShowConfetti(isDone);
      if (isDone) setTimeout(() => setShowConfetti(false), 5000);
    },
    [items]
  );

  return (
    <div className="App">
      <Confetti numberOfPieces={showConfetti ? 200 : 0} />

      <div className="flex mt-10 justify-center">
        <form onSubmit={handleSubmit} className="flex">
          <input
            type="text"
            name="task"
            value={task}
            onChange={handleChange}
            placeholder="Enter a task!"
            className="mr-2 shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
          <button
            type="submit"
            className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
          >
            Add
          </button>
        </form>
      </div>

      <div className="flex column justify-center">
        <DragDropContext onDragEnd={onDragEnd}>
          <div className="m-12">
            <KanbanColumn title="Todo" list={items.Todo} />
          </div>
          <div className="m-12">
            <KanbanColumn title="Doing" list={items.Doing} />
          </div>
          <div className="m-12">
            <KanbanColumn title="Done" list={items.Done} />
          </div>
        </DragDropContext>
      </div>
    </div>
  );
}

export default App;
