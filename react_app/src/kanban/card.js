import { Draggable } from "@hello-pangea/dnd";

const Card = ({ item, index }) => {
  return (
    <Draggable draggableId={String(item.id)} index={index}>
      {(provided) => (
        <div
          {...provided.draggableProps}
          {...provided.dragHandleProps}
          ref={provided.innerRef}
          className="flex w-full flex-col items-start gap-4 rounded-md bg-default-background px-4 py-4 shadow-sm"
        >
          <div className="flex w-full flex-col items-start gap-4">
            <div className="flex w-full items-center gap-2">
              <div className="flex flex-col">
                <span className="text-xl text-body-bold font-body-bold text-default-font">
                  Task: {item.task}
                </span>
                <span className="text-caption font-caption text-subtext-color">
                  id: {item.id}
                </span>
              </div>
            </div>
          </div>
        </div>
      )}
    </Draggable>
  );
};

export default Card;
